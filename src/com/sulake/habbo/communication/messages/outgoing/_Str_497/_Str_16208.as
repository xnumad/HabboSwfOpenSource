package com.sulake.habbo.communication.messages.outgoing._Str_497
{
    import com.sulake.core.communication.messages.IMessageComposer;

    public class _Str_16208 implements IMessageComposer 
    {
        private var _data:Array;

        public function _Str_16208()
        {
            this._data = [];
            super();
        }

        public function getMessageArray():Array
        {
            return this._data;
        }

        public function dispose():void
        {
            this._data = [];
        }
    }
}
