package com.sulake.habbo.communication.messages.outgoing._Str_381
{
    import com.sulake.core.communication.messages.IMessageComposer;

    public class _Str_4844 implements IMessageComposer 
    {
        public static const _Str_17533:int = 0;
        public static const _Str_8664:int = 1;
        public static const _Str_9186:int = 2;

        private var _data:Array;

        public function _Str_4844(k:int, _arg_2:int, _arg_3:int)
        {
            this._data = [];
            super();
            this._data.push(k);
            this._data.push(_arg_2);
            this._data.push(_arg_3);
        }

        public function getMessageArray():Array
        {
            return this._data;
        }

        public function dispose():void
        {
            this._data = null;
        }
    }
}
