//com.sulake.habbo.communication.messages.parser.help.FaqClientFaqsMessageParser

package com.sulake.habbo.communication.messages.parser.help{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.utils.Map;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class FaqClientFaqsMessageParser implements IMessageParser {

        private var _urgentData:Map;
        private var _normalData:Map;

        public function FaqClientFaqsMessageParser();

        public function get urgentData():Map;

        public function get normalData():Map;

        public function flush():Boolean;

        public function parse(k:IMessageDataWrapper):Boolean;


    }
}//package com.sulake.habbo.communication.messages.parser.help

