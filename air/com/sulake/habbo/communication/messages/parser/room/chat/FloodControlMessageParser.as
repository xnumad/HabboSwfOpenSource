//com.sulake.habbo.communication.messages.parser.room.chat.FloodControlMessageParser

package com.sulake.habbo.communication.messages.parser.room.chat{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class FloodControlMessageParser implements IMessageParser {

        private var _seconds:int;

        public function FloodControlMessageParser();

        public function get seconds():int;

        public function flush():Boolean;

        public function parse(k:IMessageDataWrapper):Boolean;


    }
}//package com.sulake.habbo.communication.messages.parser.room.chat

