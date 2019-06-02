//com.sulake.habbo.communication.messages.incoming.moderation.CfhChatlogEvent

package com.sulake.habbo.communication.messages.incoming.moderation{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.moderation.CfhChatlogMessageParser;

    [SecureSWF(rename="true")]
    public class CfhChatlogEvent extends MessageEvent implements IMessageEvent {

        public function CfhChatlogEvent(k:Function);

        public function getParser():CfhChatlogMessageParser;


    }
}//package com.sulake.habbo.communication.messages.incoming.moderation

