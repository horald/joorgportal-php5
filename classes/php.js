
function ob_start (output_callback, chunk_size, erase) {
  // http://kevin.vanzonneveld.net
  // +   original by: Brett Zamir (http://brett-zamir.me)
  // %        note 1: chunk_size and erase arguments are not presently supported
  // *     example 1: ob_start('someCallback', 4096, true);
  // *     returns 1: true

  var bufferObj = {},
    internalType = false,
    extra = false;
  erase = !(erase === false); // true is default
  chunk_size = chunk_size === 1 ? 4096 : (chunk_size || 0);

  this.php_js = this.php_js || {};
  this.php_js.obs = this.php_js.obs || []; // Array for nestable buffers
  var phpjs = this.php_js,
    ini = phpjs.ini,
    obs = phpjs.obs;

  if (!obs && (ini && ini.output_buffering && (typeof ini.output_buffering.local_value !== 'string' || ini.output_buffering.local_value.toLowerCase() !== 'off'))) {
    extra = true; // We'll run another ob_start() below (recursion prevented)
  }

  if (typeof output_callback === 'string') {
    if (output_callback === 'URL-Rewriter') { // Any others?
      internalType = true;
      output_callback = function URLRewriter() {}; // No callbacks?
    }
    if (typeof this.window[output_callback] === 'function') {
      output_callback = this.window[output_callback]; // callback expressed as a string (PHP-style)
    } else {
      return false;
    }
  }
  bufferObj = {
    erase: erase,
    chunk_size: chunk_size,
    callback: output_callback,
    type: 1,
    status: 0,
    buffer: ''
  };

  // Fix: When else do type and status vary (see also below for non-full-status)
  // type: PHP_OUTPUT_HANDLER_INTERNAL (0) or PHP_OUTPUT_HANDLER_USER (1)
  // status: PHP_OUTPUT_HANDLER_START (0), PHP_OUTPUT_HANDLER_CONT (1) or PHP_OUTPUT_HANDLER_END (2)
  // Fix: Need to add the following (for ob_get_status)?:   size: 40960, block_size:10240; how to set size/block_size?
  if (internalType) {
    bufferObj.type = 0;
  }

  obs.push(bufferObj);

  if (extra) {
    return this.ob_start(); // We have to start buffering ourselves if the preference is set (and no buffering on yet)
  }

  return true;
}


function ob_flush () {
  // http://kevin.vanzonneveld.net
  // +   original by: Brett Zamir (http://brett-zamir.me)
  // *     example 1: ob_flush();
  // *     returns 1: undefined

  var PHP_OUTPUT_HANDLER_START = 1,
    PHP_OUTPUT_HANDLER_CONT = 2;
  this.php_js = this.php_js || {};
  var phpjs = this.php_js,
    obs = phpjs.obs;

  if (!obs || !obs.length) {
    return;
  }
  var flags = 0,
    ob = obs[obs.length - 1],
    buffer = ob.buffer;
  if (ob.callback) {
    if (!ob.status) {
      flags |= PHP_OUTPUT_HANDLER_START;
    }
    flags |= PHP_OUTPUT_HANDLER_CONT;
    ob.status = 1;
    buffer = ob.callback(buffer, flags);
  }
  if (obs.length > 1) {
    obs[obs.length - 2].buffer += buffer;
  } else {
    var flushing = this.php_js.flushing;
    this.php_js.flushing = true;
    this.echo(buffer);
    this.php_js.flushing = flushing;
  }
  ob.buffer = '';
}

function ob_get_contents () {
  // http://kevin.vanzonneveld.net
  // +   original by: Brett Zamir (http://brett-zamir.me)
  // *     example 1: ob_get_contents();
  // *     returns 1: 'some buffer contents'

  this.php_js = this.php_js || {};
  var phpjs = this.php_js,
    ini = phpjs.ini,
    obs = phpjs.obs;
  if (!obs || !obs.length) {
    return (ini && ini.output_buffering && (typeof ini.output_buffering.local_value !== 'string' || ini.output_buffering.local_value.toLowerCase() !== 'off')) ? '' : false; // If output was already buffered, it would be available in obs
  }
  return obs[obs.length - 1].buffer; // Retrieve most recently added buffer contents
}

function ob_end_clean () {
  // http://kevin.vanzonneveld.net
  // +   original by: Brett Zamir (http://brett-zamir.me)
  // *     example 1: ob_end_clean();
  // *     returns 1: true

  var PHP_OUTPUT_HANDLER_START = 1,
    PHP_OUTPUT_HANDLER_END = 4;
  this.php_js = this.php_js || {};
  var phpjs = this.php_js,
    obs = phpjs.obs;

  if (!obs || !obs.length) {
    return false;
  }
  var flags = 0,
    ob = obs[obs.length - 1],
    buffer = ob.buffer;
  if (ob.callback) {
    if (!ob.status) {
      flags |= PHP_OUTPUT_HANDLER_START;
    }
    flags |= PHP_OUTPUT_HANDLER_END;
    ob.status = 2;
    buffer = ob.callback(buffer, flags);
  }
  obs.pop();
  return true;
}
