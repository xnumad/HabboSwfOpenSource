package com.sulake.habbo.ui.widget.messages
{
    public class RoomWidgetClothingChangeMessage extends RoomWidgetMessage 
    {
        public static const RWCCM_REQUEST_EDITOR:String = "RWCCM_REQUEST_EDITOR";

        private var _objectId:int = 0;
        private var _objectCategory:int = 0;
        private var _roomId:int = 0;
        private var _gender:String = "";

        public function RoomWidgetClothingChangeMessage(k:String, _arg_2:String, _arg_3:int, _arg_4:int, _arg_5:int)
        {
            super(k);
            this._gender = _arg_2;
            this._objectId = _arg_3;
            this._objectCategory = _arg_4;
            this._roomId = _arg_5;
        }

        public function get _Str_1577():int
        {
            return this._objectId;
        }

        public function get objectCategory():int
        {
            return this._objectCategory;
        }

        public function get roomId():int
        {
            return this._roomId;
        }

        public function get gender():String
        {
            return this._gender;
        }
    }
}
