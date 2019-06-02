//com.sulake.habbo.communication.messages.incoming.room.bots.BotForceOpenContextMenuEvent

package com.sulake.habbo.communication.messages.incoming.room.bots{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.room.bots.BotForceOpenContextMenuParser;

    public class BotForceOpenContextMenuEvent extends MessageEvent implements IMessageEvent {

        public function BotForceOpenContextMenuEvent(k:Function);

        public function getParser():BotForceOpenContextMenuParser;


    }
}//package com.sulake.habbo.communication.messages.incoming.room.bots

