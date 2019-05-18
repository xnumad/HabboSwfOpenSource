package com.sulake.habbo.communication.messages.outgoing._Str_63
{
    import com.sulake.core.communication.messages.IMessageComposer;

    public class _Str_10613 implements IMessageComposer 
    {
        private var _array:Array;

        public function _Str_10613(k:int, _arg_2:int, _arg_3:int, _arg_4:String, _arg_5:Boolean, _arg_6:String, _arg_7:int)
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
        }

        public function getMessageArray():Array
        {
            return this._array;
        }

        public function dispose():void
        {
        }
    }
}
