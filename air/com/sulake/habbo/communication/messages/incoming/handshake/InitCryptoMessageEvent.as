//com.sulake.habbo.communication.messages.incoming.handshake.InitCryptoMessageEvent

package com.sulake.habbo.communication.messages.incoming.handshake{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;

    [SecureSWF(rename="true")]
    public class InitCryptoMessageEvent extends MessageEvent implements IMessageEvent {

        public function InitCryptoMessageEvent(k:Function);

        public function get token():String;

        public function get isServerEncrypted():Boolean;

        public function get isClientEncrypted():Boolean;


    }
}//package com.sulake.habbo.communication.messages.incoming.handshake

