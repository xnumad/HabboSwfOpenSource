//com.sulake.habbo.communication.messages.incoming.moderation.ModeratorUserInfoEvent

package com.sulake.habbo.communication.messages.incoming.moderation{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.moderation.ModeratorUserInfoMessageParser;

    [SecureSWF(rename="true")]
    public class ModeratorUserInfoEvent extends MessageEvent implements IMessageEvent {

        public function ModeratorUserInfoEvent(k:Function);

        public function getParser():ModeratorUserInfoMessageParser;


    }
}//package com.sulake.habbo.communication.messages.incoming.moderation

