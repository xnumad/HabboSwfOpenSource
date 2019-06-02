//com.sulake.habbo.communication.messages.parser.inventory.bots.BotInventoryMessageParser

package com.sulake.habbo.communication.messages.parser.inventory.bots{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.utils.Map;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class BotInventoryMessageParser implements IMessageParser {

        private var _items:Map;

        public function BotInventoryMessageParser();

        public function flush():Boolean;

        public function parse(k:IMessageDataWrapper):Boolean;

        public function get items():Map;


    }
}//package com.sulake.habbo.communication.messages.parser.inventory.bots

