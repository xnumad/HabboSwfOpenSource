package com.sulake.habbo.communication.messages.outgoing._Str_391
{
    import com.sulake.core.communication.messages.IMessageComposer;
    import com.sulake.core.runtime.IDisposable;

    public class _Str_9957 implements IMessageComposer, IDisposable 
    {
        public static const _Str_2979:int = -1;

        private var _array:Array;

        public function _Str_9957(k:String, _arg_2:String)
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
