﻿package com.sulake.habbo.communication.messages.outgoing.room.engine
{
    import com.sulake.core.communication.messages.IMessageComposer;

    public class _Str_10983 implements IMessageComposer 
    {
        private var _petId:int;

        public function _Str_10983(k:int)
        {
            this._petId = k;
        }

        public function getMessageArray():Array
        {
            return [this._petId];
        }

        public function dispose():void
        {
        }
    }
}
