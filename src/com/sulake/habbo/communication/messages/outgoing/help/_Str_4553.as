package com.sulake.habbo.communication.messages.outgoing.help
{
    import com.sulake.core.communication.messages.IMessageComposer;
    import com.sulake.core.runtime.IDisposable;

    public class _Str_4553 implements IMessageComposer, IDisposable 
    {
        private var _array:Array;
        private var _disposed:Boolean = false;

        public function _Str_4553(k:Boolean, _arg_2:Boolean, _arg_3:Boolean, _arg_4:Boolean)
        {
            this._array = [];
            super();
            this._array = [k, _arg_2, _arg_3, _arg_4];
        }

        public function getMessageArray():Array
        {
            return this._array;
        }

        public function dispose():void
        {
            this._array = null;
            this._disposed = true;
        }

        public function get disposed():Boolean
        {
            return this._disposed;
        }
    }
}
