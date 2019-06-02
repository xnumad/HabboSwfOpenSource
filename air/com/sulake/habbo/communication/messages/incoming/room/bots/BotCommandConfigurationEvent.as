//com.sulake.habbo.communication.messages.incoming.room.bots.BotCommandConfigurationEvent

package com.sulake.habbo.communication.messages.incoming.room.bots{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.room.bots.BotCommandConfigurationParser;

    [SecureSWF(rename="true")]
    public class BotCommandConfigurationEvent extends MessageEvent implements IMessageEvent {

        public function BotCommandConfigurationEvent(k:Function);

        public function getParser():BotCommandConfigurationParser;


    }
}//package com.sulake.habbo.communication.messages.incoming.room.bots

