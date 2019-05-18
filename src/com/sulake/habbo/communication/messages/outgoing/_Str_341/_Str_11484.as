package com.sulake.habbo.communication.messages.outgoing._Str_341
{
    import com.sulake.core.communication.messages.IMessageComposer;
    import com.sulake.core.runtime.IDisposable;

    public class _Str_11484 implements IMessageComposer, IDisposable 
    {
        private var _array:Array;

        public function _Str_11484(k:Array)
        {
            var _local_2:int;
            this._array = new Array();
            super();
            this._array.push(k.length);
            for each (_local_2 in k)
            {
                this._array.push(_local_2);
            }
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
