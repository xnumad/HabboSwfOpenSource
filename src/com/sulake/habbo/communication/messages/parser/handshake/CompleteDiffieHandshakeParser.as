package com.sulake.habbo.communication.messages.parser.handshake
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class CompleteDiffieHandshakeParser implements IMessageParser 
    {
        private var _encryptedPublicKey:String;
        private var _serverClientEncryption:Boolean = false;


        public function flush():Boolean
        {
            return true;
        }

        public function parse(k:IMessageDataWrapper):Boolean
        {
            this._encryptedPublicKey = k.readString();
            if (k.bytesAvailable)
            {
                this._serverClientEncryption = k.readBoolean();
            }
            return true;
        }

        public function get encryptedPublicKey():String
        {
            return this._encryptedPublicKey;
        }

        public function get serverClientEncryption():Boolean
        {
            return this._serverClientEncryption;
        }
    }
}
