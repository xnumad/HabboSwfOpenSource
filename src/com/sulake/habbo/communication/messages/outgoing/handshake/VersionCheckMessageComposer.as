package com.sulake.habbo.communication.messages.outgoing.handshake
{
    import com.sulake.core.communication.messages.IMessageComposer;

    public class VersionCheckMessageComposer implements IMessageComposer
    {
        private var _clientID:int;
        private var _clientURL:String;
        private var _externalVariablesURL:String;

        public function VersionCheckMessageComposer(clientID:int, clientURL:String, externalVariablesURL:String)
        {
            this._clientID = clientID;
            this._clientURL = clientURL;
            this._externalVariablesURL = externalVariablesURL;
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
