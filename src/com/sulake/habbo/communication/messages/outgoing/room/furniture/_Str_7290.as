package com.sulake.habbo.communication.messages.outgoing.room.furniture
{
    import com.sulake.core.communication.messages.IMessageComposer;

    public class _Str_7290 implements IMessageComposer 
    {
        private var _array:Array;

        public function _Str_7290(k:int, _arg_2:int=-100)
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
