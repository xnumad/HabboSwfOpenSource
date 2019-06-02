package com.sulake.habbo.communication.messages.outgoing._Str_411
{
    import com.sulake.core.communication.messages.IMessageComposer;

    public class _Str_7827 implements IMessageComposer 
    {
        private var _data:Array;

        public function _Str_7827()
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
