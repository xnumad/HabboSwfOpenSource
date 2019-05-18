package com.sulake.habbo.communication.messages.outgoing._Str_79
{
    import com.sulake.core.communication.messages.IMessageComposer;

    public class _Str_10602 implements IMessageComposer 
    {
        private var _Str_10055:int;
        private var _Str_20799:int;

        public function _Str_10602(k:int, _arg_2:int)
        {
            this._Str_10055 = k;
            this._Str_20799 = _arg_2;
        }

        public function getMessageArray():Array
        {
            return [this._Str_10055, this._Str_20799];
        }

        public function dispose():void
        {
        }
    }
}
