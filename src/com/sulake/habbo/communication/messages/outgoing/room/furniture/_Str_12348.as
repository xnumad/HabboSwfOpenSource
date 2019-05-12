package com.sulake.habbo.communication.messages.outgoing.room.furniture
{
    import com.sulake.core.communication.messages.IMessageComposer;

    public class _Str_12348 implements IMessageComposer 
    {
        private var _array:Array;

        public function _Str_12348(k:int, _arg_2:Boolean)
        {
            this._array = [k, _arg_2];
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
