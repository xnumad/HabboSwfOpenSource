package com.sulake.habbo.communication.messages.outgoing._Str_63
{
    import com.sulake.core.communication.messages.IMessageComposer;

    public class _Str_9764 implements IMessageComposer 
    {
        private var _array:Array;

        public function _Str_9764(k:int, _arg_2:int, _arg_3:String)
        {
            this._array = [k, _arg_2, _arg_3];
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
