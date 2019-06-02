package com.sulake.habbo.session.events
{
    import com.sulake.habbo.session.IRoomSession;

    public class RoomSessionFavouriteGroupUpdateEvent extends RoomSessionEvent 
    {
        public static const RSFGUE_FAVOURITE_GROUP_UPDATE:String = "rsfgue_favourite_group_update";

        private var _roomIndex:int;
        private var _habboGroupId:int;
        private var _habboGroupName:String;
        private var _status:int;

        public function RoomSessionFavouriteGroupUpdateEvent(k:IRoomSession, _arg_2:int, _arg_3:int, _arg_4:int, _arg_5:String, _arg_6:Boolean=false, _arg_7:Boolean=false)
        {
            super(RSFGUE_FAVOURITE_GROUP_UPDATE, k, _arg_6, _arg_7);
            this._roomIndex = _arg_2;
            this._habboGroupId = _arg_3;
            this._habboGroupName = _arg_5;
            this._status = _arg_4;
        }

        public function get roomIndex():int
        {
            return this._roomIndex;
        }

        public function get habboGroupId():int
        {
            return this._habboGroupId;
        }

        public function get habboGroupName():String
        {
            return this._habboGroupName;
        }

        public function get status():int
        {
            return this._status;
        }
    }
}
