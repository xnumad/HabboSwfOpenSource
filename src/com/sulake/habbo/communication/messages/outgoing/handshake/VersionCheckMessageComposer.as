package com.sulake.habbo.communication.messages.outgoing.handshake
{
    import com.sulake.core.communication.messages.IMessageComposer;

    public class VersionCheckMessageComposer implements IMessageComposer
    {
        private var _clientID:int;
        private var _clientURL:String;
        private var _externalVariablesURL:String;

        public function VersionCheckMessageComposer(k:int, _arg_2:String, _arg_3:String)
        {
            this._clientID = k;
            this._clientURL = _arg_2;
            this._externalVariablesURL = _arg_3;
        }

        public function dispose():void
        {
        }

        public function getMessageArray():Array
        {
            return [this._clientID, this._clientURL, this._externalVariablesURL];
        }
    }
}
