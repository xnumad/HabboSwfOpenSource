package com.sulake.habbo.communication.messages.outgoing._Str_63
{
    import com.sulake.core.communication.messages.IMessageComposer;

    public class _Str_12442 implements IMessageComposer 
    {
        private var _array:Array;

        public function _Str_12442(k:String)
        {
            this._array = [];
            super();
            this._array = [k];
        }

        public function dispose():void
        {
            this._array = null;
        }

        public function getMessageArray():Array
        {
            return this._array;
        }
    }
}
