//com.sulake.core.window.utils.PropertyStruct

package com.sulake.core.window.utils{
    public class PropertyStruct {

        public static const HEX:String;
        public static const INT:String;
        public static const UINT:String;
        public static const NUMBER:String;
        public static const BOOLEAN:String;
        public static const STRING:String;
        public static const POINT:String;
        public static const RECTANGLE:String;
        public static const ARRAY:String;
        public static const MAP:String;

        private var _key:String;
        private var _value:Object;
        private var _type:String;
        private var _valid:Boolean;
        private var _complex:Boolean;
        private var _range:Array;

        public function PropertyStruct(k:String, _arg_2:Object, _arg_3:String, _arg_4:Boolean=false, _arg_5:Array=null);

        public function get key():String;

        public function get value():Object;

        public function get type():String;

        public function get valid():Boolean;

        public function get range():Array;

        public function withNameSpace(k:String):PropertyStruct;

        public function withoutNameSpace():PropertyStruct;

        public function withValue(k:Object):PropertyStruct;

        public function toString():String;

        public function toXMLString():String;


    }
}//package com.sulake.core.window.utils

