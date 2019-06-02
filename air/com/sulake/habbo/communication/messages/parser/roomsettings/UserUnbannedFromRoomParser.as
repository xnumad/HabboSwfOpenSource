//com.sulake.habbo.communication.messages.parser.roomsettings.UserUnbannedFromRoomParser

package com.sulake.habbo.communication.messages.parser.roomsettings{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class UserUnbannedFromRoomParser implements IMessageParser {

        private var _roomId:int;
        private var _userId:int;

        public function UserUnbannedFromRoomParser();

        public function flush():Boolean;

        public function parse(k:IMessageDataWrapper):Boolean;

        public function get roomId():int;

        public function get userId():int;


    }
}//package com.sulake.habbo.communication.messages.parser.roomsettings

