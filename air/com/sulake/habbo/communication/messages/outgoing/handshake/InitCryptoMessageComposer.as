//com.sulake.habbo.communication.messages.outgoing.handshake.InitCryptoMessageComposer

package com.sulake.habbo.communication.messages.outgoing.handshake{
    import com.sulake.core.communication.messages.IMessageComposer;
    import com.sulake.core.communication.messages.IPreEncryptionMessage;

    [SecureSWF(rename="true")]
    public class InitCryptoMessageComposer implements IMessageComposer, IPreEncryptionMessage {

        private var _content:Array;

        public function InitCryptoMessageComposer(k:int);

        public function dispose():void;

        public function getMessageArray():Array;


    }
}//package com.sulake.habbo.communication.messages.outgoing.handshake

