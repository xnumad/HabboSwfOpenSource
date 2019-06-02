//com.sulake.habbo.communication.messages.incoming.inventory.bots.BotAddedToInventoryEvent

package com.sulake.habbo.communication.messages.incoming.inventory.bots{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.inventory.bots.BotAddedToInventoryParser;

    [SecureSWF(rename="true")]
    public class BotAddedToInventoryEvent extends MessageEvent implements IMessageEvent {

        public function BotAddedToInventoryEvent(k:Function);

        public function getParser():BotAddedToInventoryParser;


    }
}//package com.sulake.habbo.communication.messages.incoming.inventory.bots

