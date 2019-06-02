//com.sulake.habbo.communication.messages.parser.navigator.CanCreateRoomMessageParser

package com.sulake.habbo.communication.messages.parser.navigator{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class CanCreateRoomMessageParser implements IMessageParser {

        public static const CREATION_ALLOWED:int;
        public static const ROOM_LIMIT_REACHED:int;

        private var _resultCode:int;
        private var _roomLimit:int;

        public function CanCreateRoomMessageParser();

        public function flush():Boolean;

        public function parse(k:IMessageDataWrapper):Boolean;

        public function get resultCode():int;

        public function get roomLimit():int;


    }
}//package com.sulake.habbo.communication.messages.parser.navigator

