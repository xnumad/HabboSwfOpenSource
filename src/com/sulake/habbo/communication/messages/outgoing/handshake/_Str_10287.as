package com.sulake.habbo.communication.messages.outgoing.handshake
{
    import com.sulake.core.communication.messages.IMessageComposer;
    import com.sulake.core.communication.messages.IPreEncryptionMessage;

    public class _Str_10287 implements IMessageComposer, IPreEncryptionMessage 
    {
        private var _publicKey:String;

        public function _Str_10287(k:String)
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
