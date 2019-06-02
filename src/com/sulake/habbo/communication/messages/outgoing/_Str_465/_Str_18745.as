package com.sulake.habbo.communication.messages.outgoing._Str_465
{
    import com.sulake.core.communication.messages.IMessageComposer;

    public class _Str_18745 implements IMessageComposer 
    {
        private var _data:Array;

        public function _Str_18745()
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
