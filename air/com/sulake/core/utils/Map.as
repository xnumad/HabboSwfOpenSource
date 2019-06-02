//com.sulake.core.utils.Map

package com.sulake.core.utils{
    import flash.utils.Proxy;
    import com.sulake.core.runtime.IDisposable;
    import flash.utils.Dictionary;
    import flash.utils.flash_proxy; 
    use namespace flash.utils.flash_proxy;

    public class Map extends Proxy implements IDisposable {

        public var length:uint;
        private var _dictionary:Dictionary;
        private var _array:Array;
        private var _keys:Array;

        public function Map();

        public function get disposed():Boolean;

        public function dispose():void;

        public function reset():void;

        public function unshift(k:*, _arg_2:*):Boolean;

        public function add(k:*, _arg_2:*):Boolean;

        public function remove(k:*);

        public function getWithIndex(k:int);

        public function getKey(k:int);

        public function getKeyFor(k:Object):Object;

        public function getKeys():Array;

        public function getKeysRef():Array;

        public function hasKey(k:*):Boolean;

        public function getValue(k:*);

        public function getValues():Array;

        public function hasValue(k:*):Boolean;

        public function indexOf(k:*):int;

        public function concatenate(k:Map):void;

        public function clone():Map;

        override flash_proxy function getProperty(k:*);

        override flash_proxy function setProperty(k:*, _arg_2:*):void;

        override flash_proxy function nextNameIndex(k:int):int;

        override flash_proxy function nextName(k:int):String;

        override flash_proxy function nextValue(k:int);

        override flash_proxy function callProperty(k:*, ... _args);


    }
}//package com.sulake.core.utils

