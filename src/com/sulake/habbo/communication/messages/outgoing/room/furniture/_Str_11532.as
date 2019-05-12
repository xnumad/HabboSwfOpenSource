package com.sulake.habbo.communication.messages.outgoing.room.furniture
{
    import com.sulake.core.communication.messages.IMessageComposer;

    public class _Str_11532 implements IMessageComposer 
    {
        private var _array:Array;

        public function _Str_11532(k:Boolean, _arg_2:String, _arg_3:Boolean)
        {
            this._array = [k, _arg_2, _arg_3];
        }

        public function getMessageArray():Array
        {
            return this._array;
        }

        public function dispose():void
        {
            this._array = null;
        }
    }
}
