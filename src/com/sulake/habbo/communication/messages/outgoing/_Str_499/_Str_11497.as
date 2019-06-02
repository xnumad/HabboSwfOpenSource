package com.sulake.habbo.communication.messages.outgoing._Str_499
{
    import com.sulake.core.communication.messages.IMessageComposer;

    public class _Str_11497 implements IMessageComposer 
    {
        private var _data:Array;

        public function _Str_11497()
        {
            this._data = [];
            super();
        }

        public function dispose():void
        {
            this._data = null;
        }

        public function getMessageArray():Array
        {
            return this._data;
        }
    }
}
