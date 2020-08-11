package com.sulake.habbo.communication.messages.outgoing.poll
{
    import com.sulake.core.communication.messages.IMessageComposer;

    public class PollRejectComposer implements IMessageComposer
    {
        private var _array:Array = null;

        public function PollRejectComposer(k:int)
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
