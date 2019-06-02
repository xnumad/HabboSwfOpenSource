//com.sulake.habbo.communication.messages.incoming.inventory.bots.BotInventoryEvent

package com.sulake.habbo.communication.messages.incoming.inventory.bots{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.inventory.bots.BotInventoryMessageParser;

    [SecureSWF(rename="true")]
    public class BotInventoryEvent extends MessageEvent implements IMessageEvent {

        public function BotInventoryEvent(k:Function);

        public function getParser():BotInventoryMessageParser;


    }
}//package com.sulake.habbo.communication.messages.incoming.inventory.bots

