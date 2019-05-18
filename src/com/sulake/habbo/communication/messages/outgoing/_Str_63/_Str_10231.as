package com.sulake.habbo.communication.messages.outgoing._Str_63
{
    import com.sulake.core.communication.messages.IMessageComposer;

    public class _Str_10231 implements IMessageComposer 
    {
        private var _array:Array;

        public function _Str_10231(k:int, _arg_2:int, _arg_3:String, _arg_4:String, _arg_5:String, _arg_6:int, _arg_7:int, _arg_8:int, _arg_9:Boolean)
        {
            this._array = [];
            super();
            this._array.push(k);
            this._array.push(_arg_2);
            this._array.push(_arg_3);
            this._array.push(_arg_4);
            this._array.push(_arg_5);
            this._array.push(_arg_6);
            this._array.push(_arg_7);
            this._array.push(_arg_8);
            this._array.push(_arg_9);
        }

        public function dispose():void
        {
            this._array = [];
        }

        public function getMessageArray():Array
        {
            return this._array;
        }
    }
}
