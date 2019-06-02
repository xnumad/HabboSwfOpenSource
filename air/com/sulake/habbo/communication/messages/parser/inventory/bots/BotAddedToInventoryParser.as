//com.sulake.habbo.communication.messages.parser.inventory.bots.BotAddedToInventoryParser

package com.sulake.habbo.communication.messages.parser.inventory.bots{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class BotAddedToInventoryParser implements IMessageParser {

        private var _item:BotData;
        private var _openInventory:Boolean;

        public function BotAddedToInventoryParser();

        public function flush():Boolean;

        public function parse(k:IMessageDataWrapper):Boolean;

        public function get item():BotData;

        public function openInventory():Boolean;


    }
}//package com.sulake.habbo.communication.messages.parser.inventory.bots

