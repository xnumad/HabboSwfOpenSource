//com.sulake.habbo.communication.messages.parser.room.action.SleepMessageParser

package com.sulake.habbo.communication.messages.parser.room.action{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class SleepMessageParser implements IMessageParser {

        private var _userId:int;
        private var _sleeping:Boolean;

        public function SleepMessageParser();

        public function get userId():int;

        public function get sleeping():Boolean;

        public function flush():Boolean;

        public function parse(k:IMessageDataWrapper):Boolean;


    }
}//package com.sulake.habbo.communication.messages.parser.room.action

