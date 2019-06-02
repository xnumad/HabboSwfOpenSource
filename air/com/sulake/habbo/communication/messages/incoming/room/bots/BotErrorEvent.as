//com.sulake.habbo.communication.messages.incoming.room.bots.BotErrorEvent

package com.sulake.habbo.communication.messages.incoming.room.bots{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.room.bots.BotErrorParser;

    [SecureSWF(rename="true")]
    public class BotErrorEvent extends MessageEvent implements IMessageEvent {

        public function BotErrorEvent(k:Function);

        public function getParser():BotErrorParser;


    }
}//package com.sulake.habbo.communication.messages.incoming.room.bots

