package com.sulake.habbo.communication.messages.outgoing._Str_57
{
    import com.sulake.core.communication.messages.IMessageComposer;
    import com.sulake.core.runtime.IDisposable;

    public class _Str_3570 implements IMessageComposer, IDisposable 
    {
        private var _array:Array;

        public function _Str_3570(k:int, _arg_2:Boolean, _arg_3:Boolean)
        {
            this._array = new Array();
            super();
            this._array.push(k);
            this._array.push(((_arg_2) ? 1 : 0));
            this._array.push(((_arg_3) ? 1 : 0));
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
