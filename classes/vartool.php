<?php

class glb
{
    static public function set($name, $value)
    {
        $GLOBALS[$name] = $value;
    }

    static public function get($name)
    {
        return $GLOBALS[$name];
    }

}

?>