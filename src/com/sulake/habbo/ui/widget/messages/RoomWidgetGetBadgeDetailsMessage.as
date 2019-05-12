package com.sulake.habbo.ui.widget.messages
{
    public class RoomWidgetGetBadgeDetailsMessage extends RoomWidgetMessage 
    {
        public static const RWGOI_MESSAGE_GET_BADGE_DETAILS:String = "RWGOI_MESSAGE_GET_BADGE_DETAILS";

        private var _own:Boolean;
        private var _groupId:int = 0;

        public function RoomWidgetGetBadgeDetailsMessage(k:Boolean, _arg_2:int)
        {
            super(RWGOI_MESSAGE_GET_BADGE_DETAILS);
            this._own = k;
            this._groupId = _arg_2;
        }

        public function get own():Boolean
        {
            return this._own;
        }

        public function get groupId():int
        {
            return this._groupId;
        }
    }
}
