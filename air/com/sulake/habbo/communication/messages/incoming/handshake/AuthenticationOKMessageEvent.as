//com.sulake.habbo.communication.messages.incoming.handshake.AuthenticationOKMessageEvent

package com.sulake.habbo.communication.messages.incoming.handshake{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;

    [SecureSWF(rename="true")]
    public class AuthenticationOKMessageEvent extends MessageEvent implements IMessageEvent {

        public function AuthenticationOKMessageEvent(k:Function);

    }
}//package com.sulake.habbo.communication.messages.incoming.handshake

