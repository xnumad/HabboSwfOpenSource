package com.sulake.habbo.ui.widget.messages
{
    public class RoomWidgetChatSelectAvatarMessage extends RoomWidgetMessage 
    {
        public static const RWCSAM_MESSAGE_SELECT_AVATAR:String = "RWCSAM_MESSAGE_SELECT_AVATAR";

        private var _objectId:int;
        private var _userName:String;
        private var _roomId:int;

        public function RoomWidgetChatSelectAvatarMessage(k:String, _arg_2:int, _arg_3:String, _arg_4:int)
        {
            super(k);
            this._objectId = _arg_2;
            this._roomId = _arg_4;
            this._userName = _arg_3;
        }

        public function get _Str_1577():int
        {
            return this._objectId;
        }

        public function get userName():String
        {
            return this._userName;
        }

        public function get roomId():int
        {
            return this._roomId;
        }
    }
}
