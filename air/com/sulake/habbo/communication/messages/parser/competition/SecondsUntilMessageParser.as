//com.sulake.habbo.communication.messages.parser.competition.SecondsUntilMessageParser

package com.sulake.habbo.communication.messages.parser.competition{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class SecondsUntilMessageParser implements IMessageParser {

        private var _timeStr:String;
        private var _secondsUntil:int;

        public function SecondsUntilMessageParser();

        public function flush():Boolean;

        public function parse(k:IMessageDataWrapper):Boolean;

        public function get timeStr():String;

        public function get secondsUntil():int;


    }
}//package com.sulake.habbo.communication.messages.parser.competition

