package com.sulake.habbo.communication.messages.outgoing._Str_364
{
    import com.sulake.core.communication.messages.IMessageComposer;
    import com.sulake.core.runtime.IDisposable;

    public class _Str_3075 implements IMessageComposer, IDisposable 
    {
        private var _data:Array;

        public function _Str_3075(k:String)
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
            this._data = null;
        }

        public function get disposed():Boolean
        {
            return this._data == null;
        }
    }
}
