package com.sulake.habbo.communication.messages.outgoing.room.furniture
{
    import com.sulake.core.communication.messages.IMessageComposer;

    public class _Str_10243 implements IMessageComposer 
    {
        private var _Str_2319:int;
        private var _Str_10526:String;

        public function _Str_10243(k:int, _arg_2:String)
        {
            this._Str_2319 = k;
            this._Str_10526 = _arg_2;
        }

        public function getMessageArray():Array
        {
            return [this._Str_2319, this._Str_10526];
        }

        public function dispose():void
        {
        }
    }
}
