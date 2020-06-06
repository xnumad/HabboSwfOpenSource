package com.sulake.habbo.ui.widget.events
{
    public class RoomWidgetRoomQueueUpdateEvent extends RoomWidgetUpdateEvent
    {
        public static const RWRQUE_VISITOR_QUEUE_STATUS:String = "RWRQUE_VISITOR_QUEUE_STATUS";
        public static const RWRQUE_SPECTATOR_QUEUE_STATUS:String = "RWRQUE_SPECTATOR_QUEUE_STATUS";

        private var _position:int;
        private var _hasHabboClub:Boolean;
        private var _isActive:Boolean;
        private var _isClubQueue:Boolean;

        public function RoomWidgetRoomQueueUpdateEvent(k:String, _arg_2:int, _arg_3:Boolean, _arg_4:Boolean, _arg_5:Boolean, _arg_6:Boolean=false, _arg_7:Boolean=false)
        {
            super(k, _arg_6, _arg_7);
            this._position = _arg_2;
            this._hasHabboClub = _arg_3;
            this._isActive = _arg_4;
            this._isClubQueue = _arg_5;
        }

        public function get position():int
        {
            return this._position;
        }

        public function get hasHabboClub():Boolean
        {
            return this._hasHabboClub;
        }

        public function get isActive():Boolean
        {
            return this._isActive;
        }

        public function get isClubQueue():Boolean
        {
            return this._isClubQueue;
        }
    }
}
