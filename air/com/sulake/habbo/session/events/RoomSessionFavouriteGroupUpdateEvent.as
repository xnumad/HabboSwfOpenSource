//com.sulake.habbo.session.events.RoomSessionFavouriteGroupUpdateEvent

package com.sulake.habbo.session.events{
    import com.sulake.habbo.session.IRoomSession;

    public class RoomSessionFavouriteGroupUpdateEvent extends RoomSessionEvent {

        public static const FAVOURITE_GROUP_UPDATE:String;

        private var _roomIndex:int;
        private var _habboGroupId:int;
        private var _habboGroupName:String;
        private var _status:int;

        public function RoomSessionFavouriteGroupUpdateEvent(k:IRoomSession, _arg_2:int, _arg_3:int, _arg_4:int, _arg_5:String, _arg_6:Boolean=false, _arg_7:Boolean=false);

        public function get roomIndex():int;

        public function get habboGroupId():int;

        public function get habboGroupName():String;

        public function get status():int;


    }
}//package com.sulake.habbo.session.events

