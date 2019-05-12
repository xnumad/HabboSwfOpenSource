package com.sulake.habbo.communication.messages.outgoing.users
{
    import com.sulake.core.communication.messages.IMessageComposer;

    public class _Str_10313 implements IMessageComposer 
    {
        private var _Str_2994:int;

        public function _Str_10313(k:int)
        {
            this._Str_2994 = k;
        }

        public function getMessageArray():Array
        {
            return [this._Str_2994];
        }

        public function dispose():void
        {
        }
    }
}
