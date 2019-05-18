package com.sulake.habbo.communication.messages.outgoing._Str_57
{
    import com.sulake.core.communication.messages.IMessageComposer;

    public class _Str_11893 implements IMessageComposer 
    {
        private var _array:Array;

        public function _Str_11893(k:int)
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
