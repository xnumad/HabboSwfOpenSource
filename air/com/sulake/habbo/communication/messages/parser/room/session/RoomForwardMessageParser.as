//com.sulake.habbo.communication.messages.parser.room.session.RoomForwardMessageParser

package com.sulake.habbo.communication.messages.parser.room.session{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class RoomForwardMessageParser implements IMessageParser {

        private var _roomId:int;

        public function RoomForwardMessageParser();

        public function get roomId():int;

        public function flush():Boolean;

        public function parse(k:IMessageDataWrapper):Boolean;


    }
}//package com.sulake.habbo.communication.messages.parser.room.session

