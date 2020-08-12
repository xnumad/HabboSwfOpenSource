package com.sulake.habbo.communication.messages.outgoing.navigator
{
    import com.sulake.core.communication.messages.IMessageComposer;

    public class CancelEventMessageComposer implements IMessageComposer
    {
        private var _array:Array;

        public function CancelEventMessageComposer(k:int)
        {
            this._array = new Array();
            super();
            this._array.push(k);
        }

        public function dispose():void
        {
        }

        public function getMessageArray():Array
        {
            return this._array;
        }
    }
}
