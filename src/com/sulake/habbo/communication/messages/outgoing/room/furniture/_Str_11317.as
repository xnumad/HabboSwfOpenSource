package com.sulake.habbo.communication.messages.outgoing.room.furniture
{
    import com.sulake.core.communication.messages.IMessageComposer;

    public class _Str_11317 implements IMessageComposer 
    {
        private var _Str_2502:int;
        private var _Str_4256:int;
        private var _Str_4302:int;
        private var _Str_4257:int;

        public function _Str_11317(k:int, _arg_2:int, _arg_3:int, _arg_4:int)
        {
            this._Str_2502 = k;
            this._Str_4256 = _arg_2;
            this._Str_4302 = _arg_3;
            this._Str_4257 = _arg_4;
        }

        public function getMessageArray():Array
        {
            return [this._Str_2502, this._Str_4256, this._Str_4302, this._Str_4257];
        }

        public function dispose():void
        {
        }
    }
}
