//com.sulake.habbo.communication.messages.parser.competition.CurrentTimingCodeMessageParser

package com.sulake.habbo.communication.messages.parser.competition{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class CurrentTimingCodeMessageParser implements IMessageParser {

        private var _schedulingStr:String;
        private var _code:String;

        public function CurrentTimingCodeMessageParser();

        public function flush():Boolean;

        public function parse(k:IMessageDataWrapper):Boolean;

        public function get schedulingStr():String;

        public function get code():String;


    }
}//package com.sulake.habbo.communication.messages.parser.competition

