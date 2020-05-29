package com.sulake.habbo.communication.messages.incoming.users
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.users.AccountSafetyLockStatusChangeMessageParser;

    public class AccountSafetyLockStatusChangeMessageEvent extends MessageEvent implements IMessageEvent
    {
        public function AccountSafetyLockStatusChangeMessageEvent(k:Function)
        {
            super(k, AccountSafetyLockStatusChangeMessageParser);
        }

        public function getParser():AccountSafetyLockStatusChangeMessageParser
        {
            return _parser as AccountSafetyLockStatusChangeMessageParser;
        }
    }
}
