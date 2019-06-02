//com.sulake.habbo.communication.messages.incoming.preferences.AccountPreferencesEvent

package com.sulake.habbo.communication.messages.incoming.preferences{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.preferences.AccountPreferencesParser;

    [SecureSWF(rename="true")]
    public class AccountPreferencesEvent extends MessageEvent implements IMessageEvent {

        public function AccountPreferencesEvent(k:Function);

        public function getParser():AccountPreferencesParser;


    }
}//package com.sulake.habbo.communication.messages.incoming.preferences

