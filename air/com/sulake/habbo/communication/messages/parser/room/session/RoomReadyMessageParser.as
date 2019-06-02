//com.sulake.habbo.communication.messages.parser.room.session.RoomReadyMessageParser

package com.sulake.habbo.communication.messages.parser.room.session{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class RoomReadyMessageParser implements IMessageParser {

        private var _roomType:String;
        private var _roomId:int;

        public function RoomReadyMessageParser();

        public function get roomType():String;

        public function get roomId():int;

        public function flush():Boolean;

        public function parse(k:IMessageDataWrapper):Boolean;


    }
}//package com.sulake.habbo.communication.messages.parser.room.session

