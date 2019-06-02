//com.sulake.habbo.communication.messages.parser.room.furniture.DiceValueMessageParser

package com.sulake.habbo.communication.messages.parser.room.furniture{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class DiceValueMessageParser implements IMessageParser {

        private var _id:int;
        private var _value:int;

        public function DiceValueMessageParser();

        public function get id():int;

        public function get value():int;

        public function flush():Boolean;

        public function parse(k:IMessageDataWrapper):Boolean;


    }
}//package com.sulake.habbo.communication.messages.parser.room.furniture

