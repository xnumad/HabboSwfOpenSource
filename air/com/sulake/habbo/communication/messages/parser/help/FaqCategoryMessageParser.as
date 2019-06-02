//com.sulake.habbo.communication.messages.parser.help.FaqCategoryMessageParser

package com.sulake.habbo.communication.messages.parser.help{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.utils.Map;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class FaqCategoryMessageParser implements IMessageParser {

        private var _categoryId:int;
        private var _description:String;
        private var _data:Map;

        public function FaqCategoryMessageParser();

        public function get categoryId():int;

        public function get description():String;

        public function get data():Map;

        public function flush():Boolean;

        public function parse(k:IMessageDataWrapper):Boolean;


    }
}//package com.sulake.habbo.communication.messages.parser.help

