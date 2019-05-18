package com.sulake.habbo.communication.messages.outgoing._Str_81
{
    import com.sulake.core.communication.messages.IMessageComposer;
    import __AS3__.vec.Vector;

    public class _Str_10352 implements IMessageComposer 
    {
        private var _array:Array;

        public function _Str_10352(k:Vector.<int>)
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
        }
    }
}
