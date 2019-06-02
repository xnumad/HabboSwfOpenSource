//com.sulake.habbo.communication.messages.incoming.moderation.ModeratorInitMessageEvent

package com.sulake.habbo.communication.messages.incoming.moderation{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.moderation.ModeratorInitMessageParser;

    [SecureSWF(rename="true")]
    public class ModeratorInitMessageEvent extends MessageEvent implements IMessageEvent {

        public function ModeratorInitMessageEvent(k:Function);

        public function getParser():ModeratorInitMessageParser;


    }
}//package com.sulake.habbo.communication.messages.incoming.moderation

