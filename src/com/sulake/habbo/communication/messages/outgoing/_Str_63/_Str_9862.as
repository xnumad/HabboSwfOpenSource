package com.sulake.habbo.communication.messages.outgoing._Str_63
{
    import com.sulake.core.communication.messages.IMessageComposer;

    public class _Str_9862 implements IMessageComposer 
    {
        private var _array:Array;

        public function _Str_9862(k:int)
        {
            this._array = [];
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
