package com.sulake.habbo.communication.messages.outgoing._Str_63
{
    import com.sulake.core.communication.messages.IMessageComposer;

    public class _Str_12382 implements IMessageComposer 
    {
        private var _array:Array;

        public function _Str_12382(k:int, _arg_2:int, _arg_3:String, _arg_4:int, _arg_5:int, _arg_6:int)
        {
            this._array = [];
            super();
            this._array = [k, _arg_2, _arg_3, _arg_4, _arg_5, _arg_6];
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
