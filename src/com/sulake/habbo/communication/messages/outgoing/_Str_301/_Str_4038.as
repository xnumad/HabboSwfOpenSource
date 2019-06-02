package com.sulake.habbo.communication.messages.outgoing._Str_301
{
    import com.sulake.core.communication.messages.IMessageComposer;

    public class _Str_4038 implements IMessageComposer 
    {
        public static const _Str_16111:int = 0;
        public static const _Str_17637:int = 1;
        public static const _Str_18299:int = 2;
        public static const _Str_15919:int = 3;

        private var _data:Array;

        public function _Str_4038(k:String, _arg_2:int)
        {
            this._data = [];
            super();
            this._data.push(k);
            this._data.push(_arg_2);
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
