package com.sulake.habbo.communication.messages.outgoing._Str_484
{
    import com.sulake.core.communication.messages.IMessageComposer;

    public class _Str_4639 implements IMessageComposer 
    {
        private var _data:Array;

        public function _Str_4639(k:String, _arg_2:String)
        {
            this._data = [];
            super();
            this._data.push(_arg_2);
            this._data.push(k);
        }

        public function getMessageArray():Array
        {
            return this._data;
        }

        public function dispose():void
        {
            this._data = null;
        }
    }
}
