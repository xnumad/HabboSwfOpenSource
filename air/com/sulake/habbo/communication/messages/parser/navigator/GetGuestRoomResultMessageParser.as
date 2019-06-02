//com.sulake.habbo.communication.messages.parser.navigator.GetGuestRoomResultMessageParser

package com.sulake.habbo.communication.messages.parser.navigator{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.runtime.IDisposable;
    import com.sulake.habbo.communication.messages.incoming.navigator.GuestRoomData;
    import com.sulake.habbo.communication.messages.incoming.roomsettings.RoomModerationSettings;
    import com.sulake.habbo.communication.messages.incoming.roomsettings.RoomChatSettings;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class GetGuestRoomResultMessageParser implements IMessageParser, IDisposable {

        private var _enterRoom:Boolean;
        private var _roomForward:Boolean;
        private var _staffPick:Boolean;
        private var _data:GuestRoomData;
        private var _isGroupMember:Boolean;
        private var _roomModerationSettings:RoomModerationSettings;
        private var _chatSettings:RoomChatSettings;

        public function GetGuestRoomResultMessageParser();

        public function flush():Boolean;

        public function parse(k:IMessageDataWrapper):Boolean;

        public function dispose():void;

        public function get disposed():Boolean;

        public function get enterRoom():Boolean;

        public function get data():GuestRoomData;

        public function get roomForward():Boolean;

        public function get staffPick():Boolean;

        public function get isGroupMember():Boolean;

        public function get roomModerationSettings():RoomModerationSettings;

        public function get chatSettings():RoomChatSettings;


    }
}//package com.sulake.habbo.communication.messages.parser.navigator

