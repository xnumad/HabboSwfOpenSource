//com.sulake.habbo.communication.messages.incoming.handshake.SecretKeyEvent

package com.sulake.habbo.communication.messages.incoming.handshake{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;

    [SecureSWF(rename="true")]
    public class SecretKeyEvent extends MessageEvent implements IMessageEvent {

        public function SecretKeyEvent(k:Function);

        public function get serverPublicKey():String;


    }
}//package com.sulake.habbo.communication.messages.incoming.handshake

