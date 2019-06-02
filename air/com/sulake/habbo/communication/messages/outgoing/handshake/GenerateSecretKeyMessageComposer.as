//com.sulake.habbo.communication.messages.outgoing.handshake.GenerateSecretKeyMessageComposer

package com.sulake.habbo.communication.messages.outgoing.handshake{
    import com.sulake.core.communication.messages.IMessageComposer;
    import com.sulake.core.communication.messages.IPreEncryptionMessage;

    [SecureSWF(rename="true")]
    public class GenerateSecretKeyMessageComposer implements IMessageComposer, IPreEncryptionMessage {

        private var _publicKey:String;

        public function GenerateSecretKeyMessageComposer(k:String);

        public function dispose():void;

        public function getMessageArray():Array;


    }
}//package com.sulake.habbo.communication.messages.outgoing.handshake

