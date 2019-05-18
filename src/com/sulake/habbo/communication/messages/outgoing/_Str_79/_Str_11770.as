package com.sulake.habbo.communication.messages.outgoing._Str_79
{
    import com.sulake.core.communication.messages.IMessageComposer;

    public class _Str_11770 implements IMessageComposer 
    {
        private var _Str_2306:int;

        public function _Str_11770(k:int)
        {
            this._Str_2306 = k;
        }

        public function dispose():void
        {
        }

        public function getMessageArray():Array
        {
            return [this._Str_2306];
        }
    }
}
