package com.sulake.habbo.communication.messages.outgoing.room.engine
{
    import com.sulake.core.communication.messages.IMessageComposer;

    public class _Str_10640 implements IMessageComposer 
    {
        private var _Str_2319:int;
        private var _array:String;
        private var _Str_3062:String;

        public function _Str_10640(k:int, _arg_2:String="", _arg_3:String="")
        {
            this._Str_2319 = k;
            this._array = _arg_3;
            this._Str_3062 = _arg_2;
        }

        public function dispose():void
        {
        }

        public function getMessageArray():Array
        {
            return [this._Str_2319, this._Str_3062, this._array];
        }
    }
}
