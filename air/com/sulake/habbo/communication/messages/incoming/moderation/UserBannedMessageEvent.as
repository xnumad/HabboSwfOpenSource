//com.sulake.habbo.communication.messages.incoming.moderation.UserBannedMessageEvent

package com.sulake.habbo.communication.messages.incoming.moderation{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.moderation.UserBannedMessageParser;

    [SecureSWF(rename="true")]
    public class UserBannedMessageEvent extends MessageEvent implements IMessageEvent {

        public function UserBannedMessageEvent(k:Function);

        public function getParser():UserBannedMessageParser;


    }
}//package com.sulake.habbo.communication.messages.incoming.moderation

