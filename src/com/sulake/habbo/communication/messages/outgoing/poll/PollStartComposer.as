package com.sulake.habbo.communication.messages.outgoing.poll
{
    import com.sulake.core.communication.messages.IMessageComposer;

    public class PollStartComposer implements IMessageComposer
    {
        private var _array:Array;

        public function PollStartComposer(k:int)
        {
            this._array = [k];
        }

        public function getMessageArray():Array
        {
            return this._array;
        }

        public function dispose():void
        {
            this._array = null;
        }
    }
}
