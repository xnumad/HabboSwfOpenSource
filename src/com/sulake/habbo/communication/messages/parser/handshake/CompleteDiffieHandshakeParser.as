package com.sulake.habbo.communication.messages.parser.handshake
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class CompleteDiffieHandshakeParser implements IMessageParser 
    {
        private var _encryptedPublicKey:String;
        private var _Str_19896:Boolean = false;


        public function flush():Boolean
        {
            return true;
        }

        public function parse(k:IMessageDataWrapper):Boolean
        {
            this._encryptedPublicKey = k.readString();
            if (k.bytesAvailable)
            {
                this._Str_19896 = k.readBoolean();
            }
            return true;
        }

        public function get _Str_16514():String
        {
            return this._encryptedPublicKey;
        }

        public function get _Str_17893():Boolean
        {
            return this._Str_19896;
        }
    }
}
