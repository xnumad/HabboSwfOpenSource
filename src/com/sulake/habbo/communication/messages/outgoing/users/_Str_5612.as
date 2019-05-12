package com.sulake.habbo.communication.messages.outgoing.users
{
    import com.sulake.core.communication.messages.IMessageComposer;

    public class _Str_5612 implements IMessageComposer 
    {
        public static const _Str_13464:int = 0;
        public static const _Str_21687:int = 1;
        public static const _Str_17798:int = 2;

        private var _array:Array;

        public function _Str_5612(k:int, _arg_2:int, _arg_3:String, _arg_4:int)
        {
            this._array = [];
            super();
            this._array.push(k);
            this._array.push(_arg_2);
            this._array.push(_arg_3);
            this._array.push(_arg_4);
        }

        public function getMessageArray():Array
        {
            return this._array;
        }

        public function dispose():void
        {
            this._array = null;
        }
    }
}
