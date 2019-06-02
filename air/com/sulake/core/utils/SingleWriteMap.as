//com.sulake.core.utils.SingleWriteMap

package com.sulake.core.utils{
    import flash.utils.flash_proxy; 
    use namespace flash.utils.flash_proxy;

    public class SingleWriteMap extends Map {

        public function SingleWriteMap();

        override flash_proxy function setProperty(k:*, _arg_2:*):void;


    }
}//package com.sulake.core.utils

