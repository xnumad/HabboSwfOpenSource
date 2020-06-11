package com.sulake.habbo.communication.messages.outgoing.handshake
{
    import com.sulake.core.communication.messages.IMessageComposer;
    import com.sulake.core.communication.messages.IPreEncryptionMessage;

    public class CompleteDiffieHandshakeMessageComposer implements IMessageComposer, IPreEncryptionMessage
    {
        private var _publicKey:String;

        public function CompleteDiffieHandshakeMessageComposer(k:String)
        {
            this._publicKey = k;
        }

        public function dispose():void
        {
        }

        public function getMessageArray():Array
        {
            return [this._publicKey];
        }
    }
}
