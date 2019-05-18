package com.sulake.habbo.communication.messages.outgoing._Str_57
{
    import com.sulake.core.communication.messages.IMessageComposer;
    import com.sulake.core.runtime.IDisposable;

    public class _Str_8348 implements IMessageComposer, IDisposable 
    {
        private var _array:Array;

        public function _Str_8348(k:String, _arg_2:String)
        {
            this._array = new Array();
            super();
            this._array.push(k);
            this._array.push(_arg_2);
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
            return false;
        }
    }
}
