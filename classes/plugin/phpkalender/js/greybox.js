AJS={BASE_URL:"",drag_obj:null,drag_elm:null,_drop_zones:[],_cur_pos:null,getScrollTop:function(){
var t;
if(document.documentElement&&document.documentElement.scrollTop){
t=document.documentElement.scrollTop;
}else{
if(document.body){
t=document.body.scrollTop;
}
}
return t;
},addClass:function(){
var _2=AJS.forceArray(arguments);
var _3=_2.pop();
var _4=function(o){
if(!new RegExp("(^|\\s)"+_3+"(\\s|$)").test(o.className)){
o.className+=(o.className?" ":"")+_3;
}
};
AJS.map(_2,function(_6){
_4(_6);
});
},setStyle:function(){
var _7=AJS.forceArray(arguments);
var _8=_7.pop();
var _9=_7.pop();
AJS.map(_7,function(_a){
_a.style[_9]=AJS.getCssDim(_8);
});
},extend:function(_b){
var _c=new this("no_init");
for(k in _b){
var _d=_c[k];
var _e=_b[k];
if(_d&&_d!=_e&&typeof _e=="function"){
_e=this._parentize(_e,_d);
}
_c[k]=_e;
}
return new AJS.Class(_c);
},log:function(o){
if(window.console){
console.log(o);
}else{
var div=AJS.$("ajs_logger");
if(!div){
div=AJS.DIV({id:"ajs_logger","style":"color: green; position: absolute; left: 0"});
div.style.top=AJS.getScrollTop()+"px";
AJS.ACN(AJS.getBody(),div);
}
AJS.setHTML(div,""+o);
}
},setHeight:function(){
var _11=AJS.forceArray(arguments);
_11.splice(_11.length-1,0,"height");
AJS.setStyle.apply(null,_11);
},_getRealScope:function(fn,_13){
_13=AJS.$A(_13);
var _14=fn._cscope||window;
return function(){
var _15=AJS.$FA(arguments).concat(_13);
return fn.apply(_14,_15);
};
},documentInsert:function(elm){
if(typeof (elm)=="string"){
elm=AJS.HTML2DOM(elm);
}
document.write("<span id=\"dummy_holder\"></span>");
AJS.swapDOM(AJS.$("dummy_holder"),elm);
},getWindowSize:function(doc){
doc=doc||document;
var _18,_19;
if(self.innerHeight){
_18=self.innerWidth;
_19=self.innerHeight;
}else{
if(doc.documentElement&&doc.documentElement.clientHeight){
_18=doc.documentElement.clientWidth;
_19=doc.documentElement.clientHeight;
}else{
if(doc.body){
_18=doc.body.clientWidth;
_19=doc.body.clientHeight;
}
}
}
return {"w":_18,"h":_19};
},flattenList:function(_1a){
var r=[];
var _1c=function(r,l){
AJS.map(l,function(o){
if(o==null){
}else{
if(AJS.isArray(o)){
_1c(r,o);
}else{
r.push(o);
}
}
});
};
_1c(r,_1a);
return r;
},isFunction:function(obj){
return (typeof obj=="function");
},setEventKey:function(e){
e.key=e.keyCode?e.keyCode:e.charCode;
if(window.event){
e.ctrl=window.event.ctrlKey;
e.shift=window.event.shiftKey;
}else{
e.ctrl=e.ctrlKey;
e.shift=e.shiftKey;
}
switch(e.key){
case 63232:
e.key=38;
break;
case 63233:
e.key=40;
break;
case 63235:
e.key=39;
break;
case 63234:
e.key=37;
break;
}
},removeElement:function(){
var _22=AJS.forceArray(arguments);
AJS.map(_22,function(elm){
AJS.swapDOM(elm,null);
});
},_unloadListeners:function(){
if(AJS.listeners){
AJS.map(AJS.listeners,function(elm,_25,fn){
AJS.REV(elm,_25,fn);
});
}
AJS.listeners=[];
},join:function(_27,_28){
try{
return _28.join(_27);
}
catch(e){
var r=_28[0]||"";
AJS.map(_28,function(elm){
r+=_27+elm;
},1);
return r+"";
}
},getIndex:function(elm,_2c,_2d){
for(var i=0;i<_2c.length;i++){
if(_2d&&_2d(_2c[i])||elm==_2c[i]){
return i;
}
}
return -1;
},isIn:function(elm,_30){
var i=AJS.getIndex(elm,_30);
if(i!=-1){
return true;
}else{
return false;
}
},isArray:function(obj){
return obj instanceof Array;
},setLeft:function(){
var _33=AJS.forceArray(arguments);
_33.splice(_33.length-1,0,"left");
AJS.setStyle.apply(null,_33);
},appendChildNodes:function(elm){
if(arguments.length>=2){
AJS.map(arguments,function(n){
if(AJS.isString(n)){
n=AJS.TN(n);
}
if(AJS.isDefined(n)){
elm.appendChild(n);
}
},1);
}
return elm;
},getElementsByTagAndClassName:function(_36,_37,_38,_39){
var _3a=[];
if(!AJS.isDefined(_38)){
_38=document;
}
if(!AJS.isDefined(_36)){
_36="*";
}
var els=_38.getElementsByTagName(_36);
var _3c=els.length;
var _3d=new RegExp("(^|\\s)"+_37+"(\\s|$)");
for(i=0,j=0;i<_3c;i++){
if(_3d.test(els[i].className)||_37==null){
_3a[j]=els[i];
j++;
}
}
if(_39){
return _3a[0];
}else{
return _3a;
}
},isOpera:function(){
return (navigator.userAgent.toLowerCase().indexOf("opera")!=-1);
},isString:function(obj){
return (typeof obj=="string");
},hideElement:function(elm){
var _40=AJS.forceArray(arguments);
AJS.map(_40,function(elm){
elm.style.display="none";
});
},setOpacity:function(elm,p){
elm.style.opacity=p;
elm.style.filter="alpha(opacity="+p*100+")";
},insertBefore:function(elm,_45){
_45.parentNode.insertBefore(elm,_45);
return elm;
},setWidth:function(){
var _46=AJS.forceArray(arguments);
_46.splice(_46.length-1,0,"width");
AJS.setStyle.apply(null,_46);
},createArray:function(v){
if(AJS.isArray(v)&&!AJS.isString(v)){
return v;
}else{
if(!v){
return [];
}else{
return [v];
}
}
},isDict:function(o){
var _49=String(o);
return _49.indexOf(" Object")!=-1;
},isMozilla:function(){
return (navigator.userAgent.toLowerCase().indexOf("gecko")!=-1&&navigator.productSub>=20030210);
},removeEventListener:function(elm,_4b,fn,_4d){
var _4e="ajsl_"+_4b+fn;
if(!_4d){
_4d=false;
}
fn=elm[_4e]||fn;
if(elm["on"+_4b]==fn){
elm["on"+_4b]=elm[_4e+"old"];
}
if(elm.removeEventListener){
elm.removeEventListener(_4b,fn,_4d);
if(AJS.isOpera()){
elm.removeEventListener(_4b,fn,!_4d);
}
}else{
if(elm.detachEvent){
elm.detachEvent("on"+_4b,fn);
}
}
},callLater:function(fn,_50){
var _51=function(){
fn();
};
window.setTimeout(_51,_50);
},setTop:function(){
var _52=AJS.forceArray(arguments);
_52.splice(_52.length-1,0,"top");
AJS.setStyle.apply(null,_52);
},_createDomShortcuts:function(){
var _53=["ul","li","td","tr","th","tbody","table","input","span","b","a","div","img","button","h1","h2","h3","h4","h5","h6","br","textarea","form","p","select","option","optgroup","iframe","script","center","dl","dt","dd","small","pre","i"];
var _54=function(elm){
AJS[elm.toUpperCase()]=function(){
return AJS.createDOM.apply(null,[elm,arguments]);
};
};
AJS.map(_53,_54);
AJS.TN=function(_56){
return document.createTextNode(_56);
};
},addCallback:function(fn){
this.callbacks.unshift(fn);
},bindMethods:function(_58){
for(var k in _58){
var _5a=_58[k];
if(typeof (_5a)=="function"){
_58[k]=AJS.$b(_5a,_58);
}
}
},partial:function(fn){
var _5c=AJS.$FA(arguments);
_5c.shift();
return function(){
_5c=_5c.concat(AJS.$FA(arguments));
return fn.apply(window,_5c);
};
},isNumber:function(obj){
return (typeof obj=="number");
},getCssDim:function(dim){
if(AJS.isString(dim)){
return dim;
}else{
return dim+"px";
}
},isIe:function(){
return (navigator.userAgent.toLowerCase().indexOf("msie")!=-1&&navigator.userAgent.toLowerCase().indexOf("opera")==-1);
},removeClass:function(){
var _5f=AJS.forceArray(arguments);
var cls=_5f.pop();
var _61=function(o){
o.className=o.className.replace(new RegExp("\\s?"+cls,"g"),"");
};
AJS.map(_5f,function(elm){
_61(elm);
});
},setHTML:function(elm,_65){
elm.innerHTML=_65;
return elm;
},map:function(_66,fn,_68,_69){
var i=0,l=_66.length;
if(_68){
i=_68;
}
if(_69){
l=_69;
}
for(i;i<l;i++){
var val=fn(_66[i],i);
if(val!=undefined){
return val;
}
}
},addEventListener:function(elm,_6e,fn,_70,_71){
var _72="ajsl_"+_6e+fn;
if(!_71){
_71=false;
}
AJS.listeners=AJS.$A(AJS.listeners);
if(AJS.isIn(_6e,["keypress","keydown","keyup","click"])){
var _73=fn;
fn=function(e){
AJS.setEventKey(e);
return _73.apply(window,arguments);
};
}
var _75=AJS.isIn(_6e,["submit","load","scroll","resize"]);
var _76=AJS.$A(elm);
AJS.map(_76,function(_77){
if(_70){
var _78=fn;
fn=function(e){
AJS.REV(_77,_6e,fn);
return _78.apply(window,arguments);
};
}
if(_75){
var _7a=_77["on"+_6e];
var _7b=function(){
if(_7a){
fn(arguments);
return _7a(arguments);
}else{
return fn(arguments);
}
};
_77[_72]=_7b;
_77[_72+"old"]=_7a;
elm["on"+_6e]=_7b;
}else{
_77[_72]=fn;
if(_77.attachEvent){
_77.attachEvent("on"+_6e,fn);
}else{
if(_77.addEventListener){
_77.addEventListener(_6e,fn,_71);
}
}
AJS.listeners.push([_77,_6e,fn]);
}
});
},preloadImages:function(){
AJS.AEV(window,"load",AJS.$p(function(_7c){
AJS.map(_7c,function(src){
var pic=new Image();
pic.src=src;
});
},arguments));
},forceArray:function(_7f){
var r=[];
AJS.map(_7f,function(elm){
r.push(elm);
});
return r;
},update:function(l1,l2){
for(var i in l2){
l1[i]=l2[i];
}
return l1;
},getBody:function(){
return AJS.$bytc("body")[0];
},HTML2DOM:function(_85,_86){
var d=AJS.DIV();
d.innerHTML=_85;
if(_86){
return d.childNodes[0];
}else{
return d;
}
},getElement:function(id){
if(AJS.isString(id)||AJS.isNumber(id)){
return document.getElementById(id);
}else{
return id;
}
},showElement:function(){
var _89=AJS.forceArray(arguments);
AJS.map(_89,function(elm){
elm.style.display="";
});
},bind:function(fn,_8c,_8d){
fn._cscope=_8c;
return AJS._getRealScope(fn,_8d);
},createDOM:function(_8e,_8f){
var i=0,_91;
var elm=document.createElement(_8e);
var _93=_8f[0];
if(AJS.isDict(_8f[i])){
for(k in _93){
_91=_93[k];
if(k=="style"||k=="s"){
elm.style.cssText=_91;
}else{
if(k=="c"||k=="class"||k=="className"){
elm.className=_91;
}else{
elm.setAttribute(k,_91);
}
}
}
i++;
}
if(_93==null){
i=1;
}
for(var j=i;j<_8f.length;j++){
var _91=_8f[j];
if(_91){
var _95=typeof (_91);
if(_95=="string"||_95=="number"){
_91=AJS.TN(_91);
}
elm.appendChild(_91);
}
}
return elm;
},swapDOM:function(_96,src){
_96=AJS.getElement(_96);
var _98=_96.parentNode;
if(src){
src=AJS.getElement(src);
_98.replaceChild(src,_96);
}else{
_98.removeChild(_96);
}
return src;
},isDefined:function(o){
return (o!="undefined"&&o!=null);
}};
AJS.$=AJS.getElement;
AJS.$$=AJS.getElements;
AJS.$f=AJS.getFormElement;
AJS.$p=AJS.partial;
AJS.$b=AJS.bind;
AJS.$A=AJS.createArray;
AJS.DI=AJS.documentInsert;
AJS.ACN=AJS.appendChildNodes;
AJS.RCN=AJS.replaceChildNodes;
AJS.AEV=AJS.addEventListener;
AJS.REV=AJS.removeEventListener;
AJS.$bytc=AJS.getElementsByTagAndClassName;
AJS.$AP=AJS.absolutePosition;
AJS.$FA=AJS.forceArray;
AJS.addEventListener(window,"unload",AJS._unloadListeners);
AJS._createDomShortcuts();
AJS.Class=function(_9a){
var fn=function(){
if(arguments[0]!="no_init"){
return this.init.apply(this,arguments);
}
};
fn.prototype=_9a;
AJS.update(fn,AJS.Class.prototype);
return fn;
};
AJS.Class.prototype={extend:function(_9c){
var _9d=new this("no_init");
for(k in _9c){
var _9e=_9d[k];
var cur=_9c[k];
if(_9e&&_9e!=cur&&typeof cur=="function"){
cur=this._parentize(cur,_9e);
}
_9d[k]=cur;
}
return new AJS.Class(_9d);
},implement:function(_a0){
AJS.update(this.prototype,_a0);
},_parentize:function(cur,_a2){
return function(){
this.parent=_a2;
return cur.apply(this,arguments);
};
}};
script_loaded=true;


script_loaded=true;

AJS.fx={_shades:{0:"ffffff",1:"ffffee",2:"ffffdd",3:"ffffcc",4:"ffffbb",5:"ffffaa",6:"ffff99"},highlight:function(_1,_2){
var _3=new AJS.fx.Base();
_3.elm=AJS.$(_1);
_3.options.duration=600;
_3.setOptions(_2);
AJS.update(_3,{increase:function(){
if(this.now==7){
_1.style.backgroundColor="#fff";
}else{
_1.style.backgroundColor="#"+AJS.fx._shades[Math.floor(this.now)];
}
}});
return _3.custom(6,0);
},fadeIn:function(_4,_5){
_5=_5||{};
if(!_5.from){
_5.from=0;
AJS.setOpacity(_4,0);
}
if(!_5.to){
_5.to=1;
}
var s=new AJS.fx.Style(_4,"opacity",_5);
return s.custom(_5.from,_5.to);
},fadeOut:function(_7,_8){
_8=_8||{};
if(!_8.from){
_8.from=1;
}
if(!_8.to){
_8.to=0;
}
_8.duration=300;
var s=new AJS.fx.Style(_7,"opacity",_8);
return s.custom(_8.from,_8.to);
},setWidth:function(_a,_b){
var s=new AJS.fx.Style(_a,"width",_b);
return s.custom(_b.from,_b.to);
},setHeight:function(_d,_e){
var s=new AJS.fx.Style(_d,"height",_e);
return s.custom(_e.from,_e.to);
}};
AJS.fx.Base=new AJS.Class({init:function(_10){
this.options={onStart:function(){
},onComplete:function(){
},transition:AJS.fx.Transitions.sineInOut,duration:500,wait:true,fps:50};
AJS.update(this.options,_10);
AJS.bindMethods(this);
},setOptions:function(_11){
AJS.update(this.options,_11);
},step:function(){
var _12=new Date().getTime();
if(_12<this.time+this.options.duration){
this.cTime=_12-this.time;
this.setNow();
}else{
setTimeout(AJS.$b(this.options.onComplete,this,[this.elm]),10);
this.clearTimer();
this.now=this.to;
}
this.increase();
},setNow:function(){
this.now=this.compute(this.from,this.to);
},compute:function(_13,to){
var _15=to-_13;
return this.options.transition(this.cTime,_13,_15,this.options.duration);
},clearTimer:function(){
clearInterval(this.timer);
this.timer=null;
return this;
},_start:function(_16,to){
if(!this.options.wait){
this.clearTimer();
}
if(this.timer){
return;
}
setTimeout(AJS.$p(this.options.onStart,this.elm),10);
this.from=_16;
this.to=to;
this.time=new Date().getTime();
this.timer=setInterval(this.step,Math.round(1000/this.options.fps));
return this;
},custom:function(_18,to){
return this._start(_18,to);
},set:function(to){
this.now=to;
this.increase();
return this;
},setStyle:function(elm,_1c,val){
if(this.property=="opacity"){
AJS.setOpacity(elm,val);
}else{
AJS.setStyle(elm,_1c,val);
}
}});
AJS.fx.Style=AJS.fx.Base.extend({init:function(elm,_1f,_20){
this.parent();
this.elm=elm;
this.setOptions(_20);
this.property=_1f;
},increase:function(){
this.setStyle(this.elm,this.property,this.now);
}});
AJS.fx.Styles=AJS.fx.Base.extend({init:function(elm,_22){
this.parent();
this.elm=AJS.$(elm);
this.setOptions(_22);
this.now={};
},setNow:function(){
for(p in this.from){
this.now[p]=this.compute(this.from[p],this.to[p]);
}
},custom:function(obj){
if(this.timer&&this.options.wait){
return;
}
var _24={};
var to={};
for(p in obj){
_24[p]=obj[p][0];
to[p]=obj[p][1];
}
return this._start(_24,to);
},increase:function(){
for(var p in this.now){
this.setStyle(this.elm,p,this.now[p]);
}
}});
AJS.fx.Transitions={linear:function(t,b,c,d){
return c*t/d+b;
},sineInOut:function(t,b,c,d){
return -c/2*(Math.cos(Math.PI*t/d)-1)+b;
}};
script_loaded=true;


script_loaded=true;

var GB_CURRENT=null;
GB_hide=function(cb){
GB_CURRENT.hide(cb);
};
GreyBox=new AJS.Class({init:function(_2){
this.use_fx=AJS.fx;
this.type="page";
this.overlay_click_close=false;
this.salt=0;
this.root_dir=GB_ROOT_DIR;
this.callback_fns=[];
this.reload_on_close=false;
this.src_loader="calendar.ajax.php";
//this.src_loader=this.root_dir+"loader_frame.html";
var _3=window.location.hostname.indexOf("www");
var _4=this.src_loader.indexOf("www");
if(_3!=-1&&_4==-1){
this.src_loader=this.src_loader.replace("://","://www.");
}
if(_3==-1&&_4!=-1){
this.src_loader=this.src_loader.replace("://www.","://");
}
this.show_loading=true;
AJS.update(this,_2);
},addCallback:function(fn){
if(fn){
this.callback_fns.push(fn);
}
},show:function(_6){
GB_CURRENT=this;
this.url=_6;
var _7=[AJS.$bytc("object"),AJS.$bytc("select")];
AJS.map(AJS.flattenList(_7),function(_8){
_8.style.visibility="hidden";
});
this.createElements();
return false;
},hide:function(cb){
var me=this;
AJS.callLater(function(){
var _b=me.callback_fns;
if(_b!=[]){
AJS.map(_b,function(fn){
fn();
});
}
me.onHide();
if(me.use_fx){
var _d=me.overlay;
AJS.fx.fadeOut(me.overlay,{onComplete:function(){
AJS.removeElement(_d);
_d=null;
},duration:300});
AJS.removeElement(me.g_window);
}else{
AJS.removeElement(me.g_window,me.overlay);
}
me.removeFrame();
AJS.REV(window,"scroll",_GB_setOverlayDimension);
AJS.REV(window,"resize",_GB_update);
var _e=[AJS.$bytc("object"),AJS.$bytc("select")];
AJS.map(AJS.flattenList(_e),function(_f){
_f.style.visibility="visible";
});
GB_CURRENT=null;
if(me.reload_on_close){
window.location.reload();
}
if(AJS.isFunction(cb)){
cb();
}
},10);
},update:function(){
this.setOverlayDimension();
this.setFrameSize();
this.setWindowPosition();
},createElements:function(){
this.initOverlay();
this.g_window=AJS.DIV({"id":"GB_window"});
AJS.hideElement(this.g_window);
AJS.getBody().insertBefore(this.g_window,this.overlay.nextSibling);
this.initFrame();
this.initHook();
this.update();
var me=this;
if(this.use_fx){
AJS.fx.fadeIn(this.overlay,{duration:300,to:0.7,onComplete:function(){
me.onShow();
AJS.showElement(me.g_window);
me.startLoading();
}});
}else{
AJS.setOpacity(this.overlay,0.7);
AJS.showElement(this.g_window);
this.onShow();
this.startLoading();
}
AJS.AEV(window,"scroll",_GB_setOverlayDimension);
AJS.AEV(window,"resize",_GB_update);
},removeFrame:function(){
try{
AJS.removeElement(this.iframe);
}
catch(e){
}
this.iframe=null;
},startLoading:function(){
this.iframe.src=this.src_loader+"?s="+this.salt++;
AJS.showElement(this.iframe);
},setOverlayDimension:function(){
var _11=AJS.getWindowSize();
if(AJS.isMozilla()||AJS.isOpera()){
AJS.setWidth(this.overlay,"100%");
}else{
AJS.setWidth(this.overlay,_11.w);
}
var _12=Math.max(AJS.getScrollTop()+_11.h,AJS.getScrollTop()+this.height);
if(_12<AJS.getScrollTop()){
AJS.setHeight(this.overlay,_12);
}else{
AJS.setHeight(this.overlay,AJS.getScrollTop()+_11.h);
}
},initOverlay:function(){
this.overlay=AJS.DIV({"id":"GB_overlay"});
if(this.overlay_click_close){
AJS.AEV(this.overlay,"click",GB_hide);
}
AJS.setOpacity(this.overlay,0);
AJS.getBody().insertBefore(this.overlay,AJS.getBody().firstChild);
},initFrame:function(){
if(!this.iframe){
var d={"name":"GB_frame","class":"GB_frame","frameBorder":0};
if(AJS.isIe()){
d.src="javascript:false;document.write(\"\");";
}
this.iframe=AJS.IFRAME(d);
this.middle_cnt=AJS.DIV({"class":"content"},this.iframe);
this.top_cnt=AJS.DIV();
this.bottom_cnt=AJS.DIV();
AJS.ACN(this.g_window,this.top_cnt,this.middle_cnt,this.bottom_cnt);
}
},onHide:function(){
},onShow:function(){
},setFrameSize:function(){
},setWindowPosition:function(){
},initHook:function(){
}});
_GB_update=function(){
if(GB_CURRENT){
GB_CURRENT.update();
}
};
_GB_setOverlayDimension=function(){
if(GB_CURRENT){
GB_CURRENT.setOverlayDimension();
}
};
//AJS.preloadImages(GB_ROOT_DIR+"indicator.gif");
script_loaded=true;
var GB_SETS={};
function decoGreyboxLinks(){
var as=AJS.$bytc("a");
AJS.map(as,function(a){
if(a.getAttribute("href")&&a.getAttribute("rel")){
var rel=a.getAttribute("rel");
if(rel.indexOf("gb_")==0){
var _17=rel.match(/\w+/)[0];
var _18=rel.match(/\[(.*)\]/)[1];
var _19=0;
var _1a={"caption":a.title||"","url":a.href};
if(_17=="gb_pageset"||_17=="gb_imageset"){
if(!GB_SETS[_18]){
GB_SETS[_18]=[];
}
GB_SETS[_18].push(_1a);
_19=GB_SETS[_18].length;
}
if(_17=="gb_pageset"){
a.onclick=function(){
GB_showFullScreenSet(GB_SETS[_18],_19);
return false;
};
}
if(_17=="gb_imageset"){
a.onclick=function(){
GB_showImageSet(GB_SETS[_18],_19);
return false;
};
}
if(_17=="gb_image"){
a.onclick=function(){
GB_showImage(_1a.caption,_1a.url);
return false;
};
}
if(_17=="gb_page"){
a.onclick=function(){
var sp=_18.split(/, ?/);
GB_show(_1a.caption,_1a.url,parseInt(sp[1]),parseInt(sp[0]));
return false;
};
}
if(_17=="gb_page_fs"){
a.onclick=function(){
GB_showFullScreen(_1a.caption,_1a.url);
return false;
};
}
if(_17=="gb_page_center"){
a.onclick=function(){
var sp=_18.split(/, ?/);
GB_showCenter(_1a.caption,_1a.url,parseInt(sp[1]),parseInt(sp[0]));
return false;
};
}
}
}
});
}
AJS.AEV(window,"load",decoGreyboxLinks);
GB_showImage=function(_1d,url,_1f){
var _20={width:300,height:300,type:"image",fullscreen:false,center_win:true,caption:_1d,callback_fn:_1f};
var win=new GB_Gallery(_20);
return win.show(url);
};
GB_showPage=function(_22,url,_24){
var _25={type:"page",caption:_22,callback_fn:_24,fullscreen:true,center_win:false};
var win=new GB_Gallery(_25);
return win.show(url);
};
GB_Gallery=GreyBox.extend({init:function(_27){
this.parent({});
this.img_close=this.root_dir+"g_close.gif";
AJS.update(this,_27);
this.addCallback(this.callback_fn);
},initHook:function(){
AJS.addClass(this.g_window,"GB_Gallery");
var _28=AJS.DIV({"class":"inner"});
this.header=AJS.DIV({"class":"GB_header"},_28);
AJS.setOpacity(this.header,0);
AJS.getBody().insertBefore(this.header,this.overlay.nextSibling);
var _29=AJS.TD({"id":"GB_caption","class":"caption","width":"40%"},this.caption);
var _2a=AJS.TD({"id":"GB_middle","class":"middle","width":"20%"});
var _2b=AJS.IMG({"src":this.img_close});
AJS.AEV(_2b,"click",GB_hide);
var _2c=AJS.TD({"class":"close","width":"40%"},_2b);
var _2d=AJS.TBODY(AJS.TR(_29,_2a,_2c));
var _2e=AJS.TABLE({"cellspacing":"0","cellpadding":0,"border":0},_2d);
AJS.ACN(_28,_2e);
if(this.fullscreen){
AJS.AEV(window,"scroll",AJS.$b(this.setWindowPosition,this));
}else{
AJS.AEV(window,"scroll",AJS.$b(this._setHeaderPos,this));
}
},setFrameSize:function(){
var _2f=this.overlay.offsetWidth;
var _30=AJS.getWindowSize();
if(this.fullscreen){
this.width=_2f-40;
this.height=_30.h-80;
}
AJS.setWidth(this.iframe,this.width);
AJS.setHeight(this.iframe,this.height);
AJS.setWidth(this.header,_2f);
},_setHeaderPos:function(){
$('GB_window').style.top = $('CalendarTableHeader').offsetTop+20  
//AJS.setTop(this.header,AJS.getScrollTop()+10);
},setWindowPosition:function(){
var _31=this.overlay.offsetWidth;
var _32=AJS.getWindowSize();
AJS.setLeft(this.g_window,((_31-50-this.width)/2));
var _33=AJS.getScrollTop()+55;
if(!this.center_win){
  $('GB_window').style.top = $('CalendarTableHeader').offsetTop+20
//AJS.setTop(this.g_window,_33);
}else{
var fl=((_32.h-this.height)/2)+20+AJS.getScrollTop();
if(fl<0){
fl=0;
}
if(_33>fl){
fl=_33;
}
//AJS.setTop(this.g_window,fl);
$('GB_window').style.top = $('CalendarTableHeader').offsetTop+20
}
this._setHeaderPos();
},onHide:function(){
AJS.removeElement(this.header);
AJS.removeClass(this.g_window,"GB_Gallery");
},onShow:function(){
if(this.use_fx){
AJS.fx.fadeIn(this.header,{to:1});
}else{
AJS.setOpacity(this.header,1);
}
}});
//AJS.preloadImages(GB_ROOT_DIR+"g_close.gif");
GB_showFullScreenSet=function(set,_36,_37){
var _38={type:"page",fullscreen:true,center_win:false};
var _39=new GB_Sets(_38,set);
_39.addCallback(_37);
_39.showSet(_36-1);
return false;
};
GB_showImageSet=function(set,_3b,_3c){
var _3d={type:"image",fullscreen:false,center_win:true,width:300,height:300};
var _3e=new GB_Sets(_3d,set);
_3e.addCallback(_3c);
_3e.showSet(_3b-1);
return false;
};
GB_Sets=GB_Gallery.extend({init:function(_3f,set){
this.parent(_3f);
if(!this.img_next){
this.img_next=this.root_dir+"next.gif";
}
if(!this.img_prev){
this.img_prev=this.root_dir+"prev.gif";
}
this.current_set=set;
},showSet:function(_41){
this.current_index=_41;
var _42=this.current_set[this.current_index];
this.show(_42.url);
this._setCaption(_42.caption);
this.btn_prev=AJS.IMG({"class":"left",src:this.img_prev});
this.btn_next=AJS.IMG({"class":"right",src:this.img_next});
AJS.AEV(this.btn_prev,"click",AJS.$b(this.switchPrev,this));
AJS.AEV(this.btn_next,"click",AJS.$b(this.switchNext,this));
GB_STATUS=AJS.SPAN({"class":"GB_navStatus"});
AJS.ACN(AJS.$("GB_middle"),this.btn_prev,GB_STATUS,this.btn_next);
this.updateStatus();
},updateStatus:function(){
AJS.setHTML(GB_STATUS,(this.current_index+1)+" / "+this.current_set.length);
if(this.current_index==0){
AJS.addClass(this.btn_prev,"disabled");
}else{
AJS.removeClass(this.btn_prev,"disabled");
}
if(this.current_index==this.current_set.length-1){
AJS.addClass(this.btn_next,"disabled");
}else{
AJS.removeClass(this.btn_next,"disabled");
}
},_setCaption:function(_43){
AJS.setHTML(AJS.$("GB_caption"),_43);
},updateFrame:function(){
var _44=this.current_set[this.current_index];
this._setCaption(_44.caption);
this.url=_44.url;
this.startLoading();
},switchPrev:function(){
if(this.current_index!=0){
this.current_index--;
this.updateFrame();
this.updateStatus();
}
},switchNext:function(){
if(this.current_index!=this.current_set.length-1){
this.current_index++;
this.updateFrame();
this.updateStatus();
}
}});
AJS.AEV(window,"load",function(){
//AJS.preloadImages(GB_ROOT_DIR+"next.gif",GB_ROOT_DIR+"prev.gif");
});
GB_show=function(_45,url,_47,_48,_49){
var _4a={caption:_45,height:_47||500,width:_48||500,fullscreen:false,callback_fn:_49};
var win=new GB_Window(_4a);
return win.show(url);
};
GB_showCenter=function(_4c,url,_4e,_4f,_50){
var _51={caption:_4c,center_win:true,height:_4e||500,width:_4f||500,fullscreen:false,callback_fn:_50};
var win=new GB_Window(_51);
return win.show(url);
};
GB_showFullScreen=function(_53,url,_55){
var _56={caption:_53,fullscreen:true,callback_fn:_55};
var win=new GB_Window(_56);
return win.show(url);
};
GB_Window=GreyBox.extend({init:function(_58){
this.parent({});
this.img_header=this.root_dir+"header_bg.gif";
this.img_close=this.root_dir+"img/del.gif";
this.show_close_img=true;
AJS.update(this,_58);
this.addCallback(this.callback_fn);
},initHook:function(){
AJS.addClass(this.g_window,"GB_Window");
this.header=AJS.TABLE({"class":"header"});
this.header.style.backgroundImage="url("+this.img_header+")";
var _59=AJS.TD({"class":"caption"},this.caption);
var _5a=AJS.TD({"class":"close"});
if(this.show_close_img){
var _5b=AJS.IMG({"src":this.img_close});
var _5c=AJS.SPAN("Abbrechen");
var btn=AJS.DIV(_5b,_5c);
AJS.AEV([_5b,_5c],"mouseover",function(){
AJS.addClass(_5c,"on");
});
AJS.AEV([_5b,_5c],"mouseout",function(){
AJS.removeClass(_5c,"on");
});
AJS.AEV([_5b,_5c],"mousedown",function(){
AJS.addClass(_5c,"click");
});
AJS.AEV([_5b,_5c],"mouseup",function(){
AJS.removeClass(_5c,"click");
});
AJS.AEV([_5b,_5c],"click",GB_hide);
AJS.ACN(_5a,btn);
}
tbody_header=AJS.TBODY();
AJS.ACN(tbody_header,AJS.TR(_59,_5a));
AJS.ACN(this.header,tbody_header);
AJS.ACN(this.top_cnt,this.header);
if(this.fullscreen){
AJS.AEV(window,"scroll",AJS.$b(this.setWindowPosition,this));
}
},setFrameSize:function(){
if(this.fullscreen){
var _5e=AJS.getWindowSize();
overlay_h=_5e.h;
this.width=Math.round(this.overlay.offsetWidth-(this.overlay.offsetWidth/100)*10);
this.height=Math.round(overlay_h-(overlay_h/100)*10);
}
AJS.setWidth(this.header,this.width+6);
AJS.setWidth(this.iframe,this.width);
AJS.setHeight(this.iframe,this.height);
},setWindowPosition:function(){
var _5f=AJS.getWindowSize();
AJS.setLeft(this.g_window,((_5f.w-this.width)/2)-13);
if(!this.center_win){
$('GB_window').style.top = $('CalendarTableHeader').offsetTop+20+40
  //AJS.setTop(this.g_window,AJS.getScrollTop());
}else{
var fl=((_5f.h-this.height)/2)-20+AJS.getScrollTop();
if(fl<0){
fl=0;
}

$('GB_window').style.top = $('CalendarTableHeader').offsetTop+20

//AJS.setTop(this.g_window,fl);
}
}});
//AJS.preloadImages(GB_ROOT_DIR+"w_close.gif",GB_ROOT_DIR+"header_bg.gif");


script_loaded=true;