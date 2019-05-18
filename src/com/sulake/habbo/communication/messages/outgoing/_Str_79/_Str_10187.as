package com.sulake.habbo.communication.messages.outgoing._Str_79
{
    import com.sulake.core.communication.messages.IMessageComposer;

    public class _Str_10187 implements IMessageComposer 
    {
        private var _Str_2388:int;

        public function _Str_10187(k:int)
        {
            this._Str_2388 = k;
        }

        public function dispose():void
        {
        }

        public function getMessageArray():Array
        {
            return [this._Str_2388];
        }
    }
}
