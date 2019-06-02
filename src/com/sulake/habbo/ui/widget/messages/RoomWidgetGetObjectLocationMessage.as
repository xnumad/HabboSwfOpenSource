package com.sulake.habbo.ui.widget.messages
{
    public class RoomWidgetGetObjectLocationMessage extends RoomWidgetMessage 
    {
        public static const RWGOI_MESSAGE_GET_OBJECT_LOCATION:String = "RWGOI_MESSAGE_GET_OBJECT_LOCATION";
        public static const RWGOI_MESSAGE_GET_GAME_OBJECT_LOCATION:String = "RWGOI_MESSAGE_GET_GAME_OBJECT_LOCATION";

        private var _objectId:int;
        private var _objectType:int;

        public function RoomWidgetGetObjectLocationMessage(k:String, _arg_2:int, _arg_3:int)
        {
            super(k);
            this._objectId = _arg_2;
            this._objectType = _arg_3;
        }

        public function get _Str_1577():int
        {
            return this._objectId;
        }

        public function get objectType():int
        {
            return this._objectType;
        }
    }
}
