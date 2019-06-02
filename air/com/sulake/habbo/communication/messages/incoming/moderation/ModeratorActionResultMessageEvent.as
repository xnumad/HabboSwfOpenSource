//com.sulake.habbo.communication.messages.incoming.moderation.ModeratorActionResultMessageEvent

package com.sulake.habbo.communication.messages.incoming.moderation{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.moderation.ModeratorActionResultMessageParser;

    [SecureSWF(rename="true")]
    public class ModeratorActionResultMessageEvent extends MessageEvent implements IMessageEvent {

        public function ModeratorActionResultMessageEvent(k:Function);

        public function getParser():ModeratorActionResultMessageParser;


    }
}//package com.sulake.habbo.communication.messages.incoming.moderation

