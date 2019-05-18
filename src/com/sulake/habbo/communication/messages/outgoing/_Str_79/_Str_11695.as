package com.sulake.habbo.communication.messages.outgoing._Str_79
{
    import com.sulake.core.communication.messages.IMessageComposer;

    public class _Str_11695 implements IMessageComposer 
    {
        private var _Str_22216:int;

        public function _Str_11695(k:int)
        {
            this._Str_22216 = k;
        }

        public function getMessageArray():Array
        {
            return [this._Str_22216];
        }

        public function dispose():void
        {
        }
    }
}
