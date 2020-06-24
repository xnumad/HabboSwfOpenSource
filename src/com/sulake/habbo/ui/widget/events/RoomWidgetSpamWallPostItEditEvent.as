package com.sulake.habbo.ui.widget.events
{
    public class RoomWidgetSpamWallPostItEditEvent extends RoomWidgetUpdateEvent
    {
        public static const RWSWPUE_OPEN_EDITOR:String = "RWSWPUE_OPEN_EDITOR";

        private var _objectId:int;
        private var _location:String;
        private var _objectType:String;

        public function RoomWidgetSpamWallPostItEditEvent(k:String, _arg_2:int, _arg_3:String, _arg_4:String, _arg_5:Boolean=false, _arg_6:Boolean=false)
        {
            super(k, _arg_5, _arg_6);
            this._objectId = _arg_2;
            this._location = _arg_3;
            this._objectType = _arg_4;
        }

        public function get location():String
        {
            return this._location;
        }

        public function get objectId():int
        {
            return this._objectId;
        }

        public function get objectType():String
        {
            return this._objectType;
        }
    }
}
