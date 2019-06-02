package com.sulake.habbo.communication.messages.outgoing._Str_411
{
    import com.sulake.core.communication.messages.IMessageComposer;

    public class _Str_7177 implements IMessageComposer 
    {
        private var _data:Array;

        public function _Str_7177(k:int, _arg_2:String, _arg_3:String)
        {
            this._data = [];
            super();
            this._data.push(k);
            this._data.push(_arg_2);
            this._data.push(_arg_3);
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
