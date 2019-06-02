//com.sulake.habbo.room.events.RoomObjectBadgeAssetEvent

package com.sulake.habbo.room.events{
    import com.sulake.room.events.RoomObjectEvent;
    import com.sulake.room.object.IRoomObject;

    public class RoomObjectBadgeAssetEvent extends RoomObjectEvent {

        public static const LOAD_BADGE:String;

        private var _badgeId:String;
        private var _groupBadge:Boolean;

        public function RoomObjectBadgeAssetEvent(k:String, _arg_2:IRoomObject, _arg_3:String, _arg_4:Boolean=true, _arg_5:Boolean=false, _arg_6:Boolean=false);

        public function get badgeId():String;

        public function get groupBadge():Boolean;


    }
}//package com.sulake.habbo.room.events

