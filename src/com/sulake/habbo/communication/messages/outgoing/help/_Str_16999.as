package com.sulake.habbo.communication.messages.outgoing.help
{
    import com.sulake.core.communication.messages.IMessageComposer;

    public class _Str_16999 implements IMessageComposer 
    {
        private var _Str_3128:int;

        public function _Str_16999(k:int)
        {
            this._Str_3128 = k;
        }

        public function getMessageArray():Array
        {
            return [this._Str_3128];
        }

        public function dispose():void
        {
        }
    }
}
