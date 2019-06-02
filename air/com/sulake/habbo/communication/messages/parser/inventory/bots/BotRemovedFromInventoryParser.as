//com.sulake.habbo.communication.messages.parser.inventory.bots.BotRemovedFromInventoryParser

package com.sulake.habbo.communication.messages.parser.inventory.bots{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class BotRemovedFromInventoryParser implements IMessageParser {

        private var _itemId:int;

        public function BotRemovedFromInventoryParser();

        public function flush():Boolean;

        public function parse(k:IMessageDataWrapper):Boolean;

        public function get itemId():int;


    }
}//package com.sulake.habbo.communication.messages.parser.inventory.bots

