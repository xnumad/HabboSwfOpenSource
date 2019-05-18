package com.sulake.habbo.communication.messages.outgoing._Str_79
{
    import com.sulake.core.communication.messages.IMessageComposer;

    public class _Str_11637 implements IMessageComposer 
    {
        private var _Str_3056:String;

        public function _Str_11637(k:String)
        {
            this._Str_3056 = k;
        }

        public function dispose():void
        {
        }

        public function getMessageArray():Array
        {
            return [this._Str_3056];
        }
    }
}
