//com.sulake.habbo.communication.messages.incoming.roomsettings.RoomModerationSettings

package com.sulake.habbo.communication.messages.incoming.roomsettings{
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class RoomModerationSettings {

        public static const MODERATION_LEVEL_NONE:int;
        public static const MODERATION_LEVEL_USER_WITH_RIGHTS:int;
        public static const MODERATION_LEVEL_ALL:int;

        private var _whoCanMute:int;
        private var _whoCanKick:int;
        private var _whoCanBan:int;

        public function RoomModerationSettings(k:IMessageDataWrapper);

        public function get whoCanMute():int;

        public function get whoCanKick():int;

        public function get whoCanBan():int;


    }
}//package com.sulake.habbo.communication.messages.incoming.roomsettings

