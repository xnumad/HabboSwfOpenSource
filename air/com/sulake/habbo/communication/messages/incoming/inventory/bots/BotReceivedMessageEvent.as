//com.sulake.habbo.communication.messages.incoming.inventory.bots.BotReceivedMessageEvent

package com.sulake.habbo.communication.messages.incoming.inventory.bots{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.inventory.bots.BotReceivedMessageParser;

    [SecureSWF(rename="true")]
    public class BotReceivedMessageEvent extends MessageEvent implements IMessageEvent {

        public function BotReceivedMessageEvent(k:Function);

        public function getParser():BotReceivedMessageParser;


    }
}//package com.sulake.habbo.communication.messages.incoming.inventory.bots

