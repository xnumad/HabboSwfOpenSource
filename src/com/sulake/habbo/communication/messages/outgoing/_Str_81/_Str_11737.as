package com.sulake.habbo.communication.messages.outgoing._Str_81
{
    import com.sulake.core.communication.messages.IMessageComposer;

    public class _Str_11737 implements IMessageComposer 
    {
        private var _Str_20479:int;

        public function _Str_11737(k:int)
        {
            this._Str_20479 = k;
        }

        public function dispose():void
        {
        }

        public function getMessageArray():Array
        {
            return [this._Str_20479];
        }
    }
}
