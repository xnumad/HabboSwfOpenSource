package com.sulake.habbo.communication.messages.outgoing._Str_57
{
    import com.sulake.core.communication.messages.IMessageComposer;
    import com.sulake.core.runtime.IDisposable;

    public class _Str_9806 implements IMessageComposer, IDisposable 
    {
        private var _array:Array;

        public function _Str_9806(k:int, _arg_2:String, _arg_3:String)
        {
            this._array = new Array();
            super();
            this._array.push(k);
            this._array.push(_arg_2);
            this._array.push(_arg_3);
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
