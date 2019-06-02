//com.sulake.habbo.communication.messages.outgoing.handshake.ClientHelloMessageComposer

package com.sulake.habbo.communication.messages.outgoing.handshake{
    import com.sulake.core.communication.messages.IMessageComposer;
    import com.sulake.core.communication.messages.IPreEncryptionMessage;

    [SecureSWF(rename="true")]
    public class ClientHelloMessageComposer implements IMessageComposer, IPreEncryptionMessage {

        private var protocolVersion:String;

        public function ClientHelloMessageComposer();

        public function dispose():void;

        public function getMessageArray():Array;


    }
}//package com.sulake.habbo.communication.messages.outgoing.handshake

