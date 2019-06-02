//com.sulake.habbo.communication.messages.incoming.inventory.bots.BotRemovedFromInventoryEvent

package com.sulake.habbo.communication.messages.incoming.inventory.bots{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.inventory.bots.BotRemovedFromInventoryParser;

    [SecureSWF(rename="true")]
    public class BotRemovedFromInventoryEvent extends MessageEvent implements IMessageEvent {

        public function BotRemovedFromInventoryEvent(k:Function);

        public function getParser():BotRemovedFromInventoryParser;


    }
}//package com.sulake.habbo.communication.messages.incoming.inventory.bots

