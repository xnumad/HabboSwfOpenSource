//com.sulake.habbo.communication.messages.parser.help.FaqCategoriesMessageParser

package com.sulake.habbo.communication.messages.parser.help{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.utils.Map;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class FaqCategoriesMessageParser implements IMessageParser {

        private var _data:Map;

        public function FaqCategoriesMessageParser();

        public function get data():Map;

        public function flush():Boolean;

        public function parse(k:IMessageDataWrapper):Boolean;


    }
}//package com.sulake.habbo.communication.messages.parser.help

