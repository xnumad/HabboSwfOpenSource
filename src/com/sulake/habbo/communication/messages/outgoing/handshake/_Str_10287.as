package com.sulake.habbo.communication.messages.outgoing.handshake
{
    import com.sulake.core.communication.messages.IMessageComposer;
    import com.sulake.core.communication.messages.IPreEncryptionMessage;

    public class _Str_10287 implements IMessageComposer, IPreEncryptionMessage 
    {
        private var _Str_11445:String;

        public function _Str_10287(k:String)
        {
            this._Str_11445 = k;
        }

        public function dispose():void
        {
        }

        public function getMessageArray():Array
        {
            return [this._Str_11445];
        }
    }
}
