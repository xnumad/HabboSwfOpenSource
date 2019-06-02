//com.sulake.habbo.communication.messages.parser.roomsettings.BannedUsersFromRoomParser

package com.sulake.habbo.communication.messages.parser.roomsettings{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class BannedUsersFromRoomParser implements IMessageParser {

        private var _roomId:int;
        private var _bannedUsers:Array;

        public function BannedUsersFromRoomParser();

        public function flush():Boolean;

        public function parse(k:IMessageDataWrapper):Boolean;

        public function get roomId():int;

        public function get bannedUsers():Array;


    }
}//package com.sulake.habbo.communication.messages.parser.roomsettings

