package com.sulake.habbo.communication.messages.outgoing._Str_301
{
    import com.sulake.core.communication.messages.IMessageComposer;

    public class _Str_4038 implements IMessageComposer 
    {
        public static const _Str_16111:int = 0;
        public static const _Str_17637:int = 1;
        public static const _Str_18299:int = 2;
        public static const _Str_15919:int = 3;

        private var _Str_594:Array;

        public function _Str_4038(k:String, _arg_2:int)
        {
            this._Str_594 = [];
            super();
            this._Str_594.push(k);
            this._Str_594.push(_arg_2);
        }

        public function getMessageArray():Array
        {
            return this._Str_594;
        }

        public function dispose():void
        {
            this._Str_594 = null;
        }
    }
}
