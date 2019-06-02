//com.sulake.core.utils.MapString

package com.sulake.core.utils{
    import com.sulake.core.runtime.IDisposable;
    import flash.utils.Dictionary;

    public class MapString implements IDisposable {

        public var length:uint;
        private var _dictionary:Dictionary;
        private var _array:Array;
        private var _keys:Array;

        public function MapString();

        public function get disposed():Boolean;

        public function dispose():void;

        public function reset():void;

        public function unshift(k:String, _arg_2:*):Boolean;

        public function add(k:String, _arg_2:*):Boolean;

        public function remove(k:String);

        public function getWithIndex(k:int);

        public function getKey(k:int);

        public function getKeys():Array;

        public function getKeysRef():Array;

        public function hasKey(k:String):Boolean;

        public function getValue(k:String);

        public function getValues():Array;

        public function hasValue(k:String):Boolean;

        public function indexOf(k:*):int;

        public function concatenate(k:MapString):void;

        public function clone():MapString;


    }
}//package com.sulake.core.utils

