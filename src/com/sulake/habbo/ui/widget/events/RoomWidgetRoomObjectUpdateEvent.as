package com.sulake.habbo.ui.widget.events
{
    public class RoomWidgetRoomObjectUpdateEvent extends RoomWidgetUpdateEvent 
    {
        public static const OBJECT_SELECTED:String = "RWROUE_OBJECT_SELECTED";
        public static const OBJECT_DESELECTED:String = "RWROUE_OBJECT_DESELECTED";
        public static const USER_REMOVED:String = "RWROUE_USER_REMOVED";
        public static const FURNI_REMOVED:String = "RWROUE_FURNI_REMOVED";
        public static const FURNI_ADDED:String = "RWROUE_FURNI_ADDED";
        public static const USER_ADDED:String = "RWROUE_USER_ADDED";
        public static const OBJECT_ROLL_OVER:String = "RWROUE_OBJECT_ROLL_OVER";
        public static const OBJECT_ROLL_OUT:String = "RWROUE_OBJECT_ROLL_OUT";

        private var _id:int = 0;
        private var _category:int = 0;
        private var _roomId:int = 0;

        public function RoomWidgetRoomObjectUpdateEvent(k:String, _arg_2:int, _arg_3:int, _arg_4:int, _arg_5:Boolean=false, _arg_6:Boolean=false)
        {
            super(k, _arg_5, _arg_6);
            this._id = _arg_2;
            this._category = _arg_3;
            this._roomId = _arg_4;
        }

        public function get id():int
        {
            return this._id;
        }

        public function get category():int
        {
            return this._category;
        }

        public function get roomId():int
        {
            return this._roomId;
        }
    }
}
