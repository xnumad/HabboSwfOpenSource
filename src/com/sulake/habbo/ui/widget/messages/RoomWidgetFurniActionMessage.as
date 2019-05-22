package com.sulake.habbo.ui.widget.messages
{
    public class RoomWidgetFurniActionMessage extends RoomWidgetMessage 
    {
        public static const RWFUAM_ROTATE:String = "RWFUAM_ROTATE";
        public static const RWFAM_MOVE:String = "RWFAM_MOVE";
        public static const RWFAM_PICKUP:String = "RWFAM_PICKUP";
        public static const RWFAM_EJECT:String = "RWFAM_EJECT";
        public static const RWFAM_USE:String = "RWFAM_USE";
        public static const RWFAM_OPEN_WELCOME_GIFT:String = "RWFAM_OPEN_WELCOME_GIFT";
        public static const RWFAM_SAVE_STUFF_DATA:String = "RWFAM_SAVE_STUFF_DATA";

        private var _furniId:int = 0;
        private var _furniCategory:int = 0;
        private var _offerId:int;
        private var _objectData:String;

        public function RoomWidgetFurniActionMessage(k:String, _arg_2:int, _arg_3:int, _arg_4:int=-1, _arg_5:String=null)
        {
            super(k);
            this._furniId = _arg_2;
            this._furniCategory = _arg_3;
            this._offerId = _arg_4;
            this._objectData = _arg_5;
        }

        public function get furniId():int
        {
            return this._furniId;
        }

        public function get furniCategory():int
        {
            return this._furniCategory;
        }

        public function get objectData():String
        {
            return this._objectData;
        }

        public function get offerId():int
        {
            return this._offerId;
        }
    }
}
