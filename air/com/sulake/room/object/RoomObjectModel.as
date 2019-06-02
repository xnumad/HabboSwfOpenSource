//com.sulake.room.object.RoomObjectModel

package com.sulake.room.object{
    import flash.utils.Dictionary;
    import com.sulake.core.utils.Map;

    public class RoomObjectModel implements IRoomObjectModelController {

        private static const MAP_KEYS_PREFIX:String;
        private static const MAP_VALUES_PREFIX:String;

        private var _numberDataList:Dictionary;
        private var _stringDataList:Dictionary;
        private var _numberArrayDataList:Dictionary;
        private var _stringArrayDataList:Dictionary;
        private var _numberReadOnlyList:Array;
        private var _stringReadOnlyList:Array;
        private var _numberArrayReadOnlyList:Array;
        private var _stringArrayReadOnlyList:Array;
        private var _updateID:int;

        public function RoomObjectModel();

        public function dispose():void;

        public function hasNumber(k:String):Boolean;

        public function hasNumberArray(k:String):Boolean;

        public function hasString(k:String):Boolean;

        public function hasStringArray(k:String):Boolean;

        public function getNumber(k:String):Number;

        public function getString(k:String):String;

        public function getNumberArray(k:String):Array;

        public function getStringArray(k:String):Array;

        public function getStringToStringMap(k:String):Map;

        public function setNumber(k:String, _arg_2:Number, _arg_3:Boolean=false):void;

        public function setString(k:String, _arg_2:String, _arg_3:Boolean=false):void;

        public function setNumberArray(k:String, _arg_2:Array, _arg_3:Boolean=false):void;

        public function setStringArray(k:String, _arg_2:Array, _arg_3:Boolean=false):void;

        public function setStringToStringMap(k:String, _arg_2:Map, _arg_3:Boolean=false):void;

        public function getUpdateID():int;


    }
}//package com.sulake.room.object

