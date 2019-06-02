//com.sulake.habbo.communication.messages.incoming.users.WelcomeGiftChangeEmailResultEvent

package com.sulake.habbo.communication.messages.incoming.users{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.users.WelcomeGiftChangeEmailResultParser;

    [SecureSWF(rename="true")]
    public class WelcomeGiftChangeEmailResultEvent extends MessageEvent implements IMessageEvent {

        public function WelcomeGiftChangeEmailResultEvent(k:Function);

        public function getParser():WelcomeGiftChangeEmailResultParser;


    }
}//package com.sulake.habbo.communication.messages.incoming.users

