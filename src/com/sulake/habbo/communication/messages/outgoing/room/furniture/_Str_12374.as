﻿package com.sulake.habbo.communication.messages.outgoing.room.furniture
{
    import com.sulake.core.communication.messages.IMessageComposer;

    public class _Str_12374 implements IMessageComposer 
    {
        private var _furniId:int;

        public function _Str_12374(k:int)
        {
            this._furniId = k;
        }

        public function dispose():void
        {
        }

        public function getMessageArray():Array
        {
            return [this._furniId];
        }
    }
}
