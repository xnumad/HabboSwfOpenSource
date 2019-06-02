//com.sulake.habbo.communication.messages.parser.help.FaqSearchResultsMessageParser

package com.sulake.habbo.communication.messages.parser.help{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.utils.Map;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class FaqSearchResultsMessageParser implements IMessageParser {

        private var _data:Map;

        public function FaqSearchResultsMessageParser();

        public function get data():Map;

        public function flush():Boolean;

        public function parse(k:IMessageDataWrapper):Boolean;


    }
}//package com.sulake.habbo.communication.messages.parser.help

