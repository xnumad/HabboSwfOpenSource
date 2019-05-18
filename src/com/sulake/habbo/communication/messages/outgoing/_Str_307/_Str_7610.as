package com.sulake.habbo.communication.messages.outgoing._Str_307
{
    import com.sulake.core.communication.messages.IMessageComposer;
    import com.sulake.core.runtime.IDisposable;

    public class _Str_7610 implements IMessageComposer, IDisposable 
    {
        public static const _Str_18366:int = 1;
        public static const _Str_17086:int = 2;

        private var _array:Array;

        public function _Str_7610(k:int, _arg_2:int, _arg_3:int)
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
