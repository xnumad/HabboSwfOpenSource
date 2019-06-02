//com.sulake.habbo.communication.messages.incoming.handshake.IdentityAccountsEvent

package com.sulake.habbo.communication.messages.incoming.handshake{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.handshake.IdentityAccountsMessageParser;

    [SecureSWF(rename="true")]
    public class IdentityAccountsEvent extends MessageEvent implements IMessageEvent {

        public function IdentityAccountsEvent(k:Function);

        public function getParser():IdentityAccountsMessageParser;


    }
}//package com.sulake.habbo.communication.messages.incoming.handshake

