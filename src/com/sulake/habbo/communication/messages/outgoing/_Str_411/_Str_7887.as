package com.sulake.habbo.communication.messages.outgoing._Str_411
{
    import com.sulake.core.communication.messages.IMessageComposer;

    public class _Str_7887 implements IMessageComposer 
    {
        private var _data:Array;

        public function _Str_7887(k:String)
        {
            this._data = new Array();
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
