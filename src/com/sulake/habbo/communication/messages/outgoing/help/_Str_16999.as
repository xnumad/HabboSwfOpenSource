package com.sulake.habbo.communication.messages.outgoing.help
{
    import com.sulake.core.communication.messages.IMessageComposer;

    public class _Str_16999 implements IMessageComposer 
    {
        private var _questionId:int;

        public function _Str_16999(k:int)
        {
            this._questionId = k;
        }

        public function getMessageArray():Array
        {
            return [this._questionId];
        }

        public function dispose():void
        {
        }
    }
}
