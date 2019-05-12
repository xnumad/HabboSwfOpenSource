package com.sulake.habbo.ui.widget.messages
{
    public class RoomWidgetRoomObjectMessage extends RoomWidgetMessage 
    {
        public static const RWROM_GET_OBJECT_INFO:String = "RWROM_GET_OBJECT_INFO";
        public static const RWROM_GET_OBJECT_NAME:String = "RWROM_GET_OBJECT_NAME";
        public static const RWROM_SELECT_OBJECT:String = "RWROM_SELECT_OBJECT";
        public static const RWROM_GET_OWN_CHARACTER_INFO:String = "RWROM_GET_OWN_CHARACTER_INFO";
        public static const RWROM_GET_AVATAR_LIST:String = "RWROM_GET_AVATAR_LIST";

        private var _id:int = 0;
        private var _category:int = 0;

        public function RoomWidgetRoomObjectMessage(k:String, id:int, category:int)
        {
            super(k);
            this._id = id;
            this._category = category;
        }

        public function get id():int
        {
            return this._id;
        }

        public function get category():int
        {
            return this._category;
        }
    }
}
