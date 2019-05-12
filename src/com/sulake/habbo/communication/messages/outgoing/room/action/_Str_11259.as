package com.sulake.habbo.communication.messages.outgoing.room.action
{
    import com.sulake.core.communication.messages.IMessageComposer;

    public class _Str_11259 implements IMessageComposer 
    {
        private var _Str_2306:int;
        private var _Str_2337:int = 0;
        private var _Str_22053:int;

        public function _Str_11259(k:int, _arg_2:int, _arg_3:int=0)
        {
            this._Str_2306 = k;
            this._Str_2337 = _arg_3;
            this._Str_22053 = _arg_2;
        }

        public function dispose():void
        {
        }

        public function getMessageArray():Array
        {
            return [this._Str_2306, this._Str_2337, this._Str_22053];
        }
    }
}
