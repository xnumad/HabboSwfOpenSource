//com.sulake.habbo.avatareditor.FigureData

package com.sulake.habbo.avatareditor{
    import flash.utils.Dictionary;

    public class FigureData {

        public static const DEFAULT_MALE_FIGURE:String;
        public static const DEFAULT_FEMALE_FIGURE:String;
        public static const MALE:String;
        public static const FEMALE:String;
        public static const UNISEX:String;
        public static const SCALE:String;
        public static const ACTION:String;
        public static const DEFAULT_FRAME:String;
        private static const BLOCKED_FX_TYPES:Array;

        private var _data:Dictionary;
        private var _colors:Dictionary;
        private var _isDisposed:Boolean;
        private var _direction:int;
        private var _gender:String;
        private var _avatarEffectType:int;
        private var _avatarEditor:HabboTabletAvatarEditor;

        public function FigureData(k:HabboTabletAvatarEditor);

        public function loadAvatarData(k:String, _arg_2:String):void;

        public function dispose():void;

        public function get disposed():Boolean;

        private function parseFigureString(k:String):void;

        public function getPartSetId(k:String):int;

        public function getColourIds(k:String):Array;

        public function getFigureString():String;

        public function savePartData(k:String, _arg_2:int, _arg_3:Array, _arg_4:Boolean=false):void;

        private function savePartSetId(k:String, _arg_2:int, _arg_3:Boolean=true):void;

        public function savePartSetColourId(k:String, _arg_2:Array, _arg_3:Boolean=true):void;

        public function getFigureStringWithFace(k:int):String;

        public function set avatarEffectType(k:int):void;

        public function get avatarEffectType():int;

        public function get direction():int;

        public function set direction(k:int):void;

        public function hasInvalidClubItems(k:int):Boolean;


    }
}//package com.sulake.habbo.avatareditor

