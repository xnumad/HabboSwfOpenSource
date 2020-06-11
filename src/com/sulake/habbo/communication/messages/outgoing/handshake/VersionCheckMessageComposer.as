﻿package com.sulake.habbo.communication.messages.outgoing.handshake
{
    import com.sulake.core.communication.messages.IMessageComposer;

    public class VersionCheckMessageComposer implements IMessageComposer
    {
        private var _clientID:int;
        private var _Str_9320:String;
        private var _Str_20206:String;

        public function VersionCheckMessageComposer(k:int, _arg_2:String, _arg_3:String)
        {
            this._clientID = k;
            this._Str_9320 = _arg_2;
            this._Str_20206 = _arg_3;
        }

        public function dispose():void
        {
        }

        public function getMessageArray():Array
        {
            return [this._clientID, this._Str_9320, this._Str_20206];
        }
    }
}
