package com.sulake.habbo.communication.messages.outgoing._Str_84
{
    import com.sulake.core.communication.messages.IMessageComposer;

    public class _Str_10646 implements IMessageComposer 
    {
        private var _Str_2337:int;

        public function _Str_10646(k:int)
        {
            this._Str_2337 = k;
        }

        public function dispose():void
        {
        }

        public function getMessageArray():Array
        {
            return [this._Str_2337];
        }
    }
}
