//com.sulake.habbo.communication.messages.parser.room.engine.RoomEntryInfoMessageParser

package com.sulake.habbo.communication.messages.parser.room.engine{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class RoomEntryInfoMessageParser implements IMessageParser {

        private var _guestRoomId:int;
        private var _owner:Boolean;

        public function RoomEntryInfoMessageParser();

        public function get guestRoomId():int;

        public function get owner():Boolean;

        public function flush():Boolean;

        public function parse(k:IMessageDataWrapper):Boolean;


    }
}//package com.sulake.habbo.communication.messages.parser.room.engine

