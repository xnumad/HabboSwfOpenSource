package com.sulake.habbo.communication.messages.outgoing._Str_465
{
    import com.sulake.core.communication.messages.IMessageComposer;

    public class _Str_17897 implements IMessageComposer 
    {
        private var _Str_21430:Boolean;

        public function _Str_17897(k:Boolean=true)
        {
            this._Str_21430 = k;
        }

        public function getMessageArray():Array
        {
            return [this._Str_21430];
        }

        public function dispose():void
        {
        }
    }
}
