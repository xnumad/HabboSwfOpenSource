//com.sulake.habbo.room.messages.RoomObjectGroupBadgeUpdateMessage

package com.sulake.habbo.room.messages{
    import com.sulake.room.messages.RoomObjectUpdateMessage;

    public class RoomObjectGroupBadgeUpdateMessage extends RoomObjectUpdateMessage {

        public static const BADGE_LOADED:String;

        private var _badgeId:String;
        private var _assetName:String;

        public function RoomObjectGroupBadgeUpdateMessage(k:String, _arg_2:String);

        public function get badgeId():String;

        public function get assetName():String;


    }
}//package com.sulake.habbo.room.messages

