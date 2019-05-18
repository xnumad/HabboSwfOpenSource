package com.sulake.habbo.communication.messages.outgoing._Str_63
{
    import com.sulake.core.communication.messages.IMessageComposer;

    public class _Str_11178 implements IMessageComposer 
    {
        private var _array:Array;

        public function _Str_11178(k:String)
        {
            this._array = [k];
        }

        public function dispose():void
        {
            this._array = null;
        }

        public function getMessageArray():Array
        {
            return this._array;
        }
    }
}
