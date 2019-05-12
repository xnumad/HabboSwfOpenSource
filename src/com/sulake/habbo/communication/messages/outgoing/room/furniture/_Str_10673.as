package com.sulake.habbo.communication.messages.outgoing.room.furniture
{
    import com.sulake.core.communication.messages.IMessageComposer;

    public class _Str_10673 implements IMessageComposer 
    {
        private var _Str_2319:int;

        public function _Str_10673(k:int)
        {
            this._Str_2319 = k;
        }

        public function dispose():void
        {
        }

        public function getMessageArray():Array
        {
            return [this._Str_2319];
        }
    }
}
