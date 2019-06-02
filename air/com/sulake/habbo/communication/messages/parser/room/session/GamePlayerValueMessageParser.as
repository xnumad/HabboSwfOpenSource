//com.sulake.habbo.communication.messages.parser.room.session.GamePlayerValueMessageParser

package com.sulake.habbo.communication.messages.parser.room.session{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class GamePlayerValueMessageParser implements IMessageParser {

        private var _userId:int;
        private var _value:int;

        public function GamePlayerValueMessageParser();

        public function get userId():int;

        public function get value():int;

        public function flush():Boolean;

        public function parse(k:IMessageDataWrapper):Boolean;


    }
}//package com.sulake.habbo.communication.messages.parser.room.session

