package com.sulake.habbo.communication.messages.outgoing._Str_497
{
    import com.sulake.core.communication.messages.IMessageComposer;

    public class _Str_7123 implements IMessageComposer 
    {
        private var _data:Array;

        public function _Str_7123(k:int)
        {
            this._data = [];
            super();
            this._data.push(k);
        }

        public function getMessageArray():Array
        {
            return this._data;
        }

        public function dispose():void
        {
        }
    }
}
