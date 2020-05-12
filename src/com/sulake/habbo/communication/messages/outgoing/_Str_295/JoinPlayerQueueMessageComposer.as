package com.sulake.habbo.communication.messages.outgoing._Str_295
{
    import com.sulake.core.communication.messages.IMessageComposer;

    public class JoinPlayerQueueMessageComposer implements IMessageComposer 
    {
        private var _data:Array;

        public function JoinPlayerQueueMessageComposer(k:int)
        {
            this._data = [];
            super();
            this._data.push(k);
        }

        public function getMessageArray():Array
        {
            return this._data;
        }

        public function dispose():void
        {
            this._data = [];
        }
    }
}
