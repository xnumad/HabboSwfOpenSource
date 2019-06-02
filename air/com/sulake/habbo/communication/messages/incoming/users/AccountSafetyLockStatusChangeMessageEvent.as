//com.sulake.habbo.communication.messages.incoming.users.AccountSafetyLockStatusChangeMessageEvent

package com.sulake.habbo.communication.messages.incoming.users{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.users.AccountSafetyLockStatusChangeMessageParser;

    [SecureSWF(rename="true")]
    public class AccountSafetyLockStatusChangeMessageEvent extends MessageEvent implements IMessageEvent {

        public function AccountSafetyLockStatusChangeMessageEvent(k:Function);

        public function getParser():AccountSafetyLockStatusChangeMessageParser;


    }
}//package com.sulake.habbo.communication.messages.incoming.users

