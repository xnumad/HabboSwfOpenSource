package com.sulake.habbo.communication.messages.outgoing._Str_381
{
    import com.sulake.core.communication.messages.IMessageComposer;

    public class _Str_11301 implements IMessageComposer 
    {
        private var _Str_2388:int;

        public function _Str_11301(k:int)
        {
            this._Str_2388 = k;
        }

        public function getMessageArray():Array
        {
            return [this._Str_2388];
        }

        public function dispose():void
        {
        }
    }
}
