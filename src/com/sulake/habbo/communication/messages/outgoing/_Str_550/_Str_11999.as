package com.sulake.habbo.communication.messages.outgoing._Str_550
{
    import com.sulake.core.communication.messages.IMessageComposer;

    public class _Str_11999 implements IMessageComposer 
    {
        private var _Str_16156:int;

        public function _Str_11999(k:int)
        {
            this._Str_16156 = k;
        }

        public function dispose():void
        {
        }

        public function getMessageArray():Array
        {
            return [this._Str_16156];
        }
    }
}
