package com.sulake.habbo.communication.messages.outgoing._Str_428
{
    import com.sulake.core.communication.messages.IMessageComposer;
    import com.sulake.core.runtime.IDisposable;
    import __AS3__.vec.Vector;

    public class _Str_11372 implements IMessageComposer, IDisposable 
    {
        private var _array:Array;

        public function _Str_11372(k:Vector.<_Str_4584>)
        {
            var _local_2:_Str_4584;
            this._array = new Array();
            super();
            this._array.push((k.length * 3));
            for each (_local_2 in k)
            {
                this._array.push(_local_2.dayIndex);
                this._array.push(_local_2.stepIndex);
                this._array.push(_local_2._Str_22800);
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
