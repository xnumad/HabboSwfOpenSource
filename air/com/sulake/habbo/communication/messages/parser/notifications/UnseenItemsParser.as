//com.sulake.habbo.communication.messages.parser.notifications.UnseenItemsParser

package com.sulake.habbo.communication.messages.parser.notifications{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.utils.Map;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class UnseenItemsParser implements IMessageParser {

        private var _items:Map;

        public function UnseenItemsParser();

        public function flush():Boolean;

        public function parse(k:IMessageDataWrapper):Boolean;

        public function getCategories():Array;

        public function getItemsByCategory(k:int):Array;


    }
}//package com.sulake.habbo.communication.messages.parser.notifications

