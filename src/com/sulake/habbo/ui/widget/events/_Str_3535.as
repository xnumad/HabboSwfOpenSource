package com.sulake.habbo.ui.widget.events
{
    import flash.display.BitmapData;

    public class _Str_3535 extends RoomWidgetUpdateEvent 
    {
        public static const RWCUE_EVENT_CHAT:String = "RWCUE_EVENT_CHAT";
        public static const CHAT_TYPE_SPEAK:int = 0;
        public static const CHAT_TYPE_WHISPER:int = 1;
        public static const CHAT_TYPE_SHOUT:int = 2;
        public static const CHAT_TYPE_RESPECT:int = 3;
        public static const CHAT_TYPE_PETRESPECT:int = 4;
        public static const _Str_15836:int = 5;
        public static const CHAT_TYPE_PETTREAT:int = 6;
        public static const CHAT_TYPE_PETREVIVE:int = 7;
        public static const CHAT_TYPE_PET_REBREED_FERTILIZE:int = 8;
        public static const CHAT_TYPE_PET_SPEED_FERTILIZE:int = 9;
        public static const _Str_21809:int = 10;
        public static const _Str_19381:int = 11;
        public static const _Str_19852:int = 12;

        private var _userId:int = 0;
        private var _text:String = "";
        private var _Str_3230:int = 0;
        private var _userName:String;
        private var _links:Array;
        private var _Str_19459:Number;
        private var _Str_22119:Number;
        private var _Str_20012:BitmapData;
        private var _Str_22210:uint;
        private var _roomId:int;
        private var _Str_22055:int;
        private var _Str_3021:int;
        private var _Str_6689:int;
        private var _styleId:int;

        public function _Str_3535(k:String, _arg_2:int, _arg_3:String, _arg_4:String, _arg_5:int, _arg_6:int, _arg_7:int, _arg_8:Number, _arg_9:Number, _arg_10:BitmapData, _arg_11:uint, _arg_12:int, _arg_13:int=0, _arg_14:int=0, _arg_15:Array=null, _arg_16:Boolean=false, _arg_17:Boolean=false)
        {
            super(k, _arg_16, _arg_17);
            this._userId = _arg_2;
            this._text = _arg_3;
            this._Str_3230 = _arg_13;
            this._userName = _arg_4;
            this._Str_22055 = _arg_5;
            this._Str_3021 = _arg_6;
            this._Str_6689 = _arg_7;
            this._links = _arg_15;
            this._Str_19459 = _arg_8;
            this._Str_22119 = _arg_9;
            this._Str_20012 = _arg_10;
            this._Str_22210 = _arg_11;
            this._roomId = _arg_12;
            this._styleId = _arg_14;
        }

        public function get userId():int
        {
            return this._userId;
        }

        public function get text():String
        {
            return this._text;
        }

        public function get chatType():int
        {
            return this._Str_3230;
        }

        public function get userName():String
        {
            return this._userName;
        }

        public function get _Str_23083():int
        {
            return this._Str_22055;
        }

        public function get _Str_2908():int
        {
            return this._Str_3021;
        }

        public function get _Str_4355():int
        {
            return this._Str_6689;
        }

        public function get links():Array
        {
            return this._links;
        }

        public function get _Str_24184():Number
        {
            return this._Str_19459;
        }

        public function get _Str_26168():Number
        {
            return this._Str_22119;
        }

        public function get _Str_23069():BitmapData
        {
            return this._Str_20012;
        }

        public function get _Str_24330():uint
        {
            return this._Str_22210;
        }

        public function get roomId():int
        {
            return this._roomId;
        }

        public function get styleId():int
        {
            return this._styleId;
        }
    }
}
