package com.sulake.habbo.communication.messages.outgoing._Str_370
{
    import com.sulake.core.communication.messages.IMessageComposer;
    import com.sulake.core.runtime.IDisposable;

    public class _Str_12096 implements IMessageComposer, IDisposable 
    {
        private var _array:Array;

        public function _Str_12096(k:int)
        {
            this._array = new Array();
            super();
            this._array.push(k);
        }

        public function getMessageArray():Array
        {
            return this._array;
        }

        public function dispose():void
        {
            this._array = null;
        }

        public function get disposed():Boolean
        {
            return this._array == null;
        }
    }
}
