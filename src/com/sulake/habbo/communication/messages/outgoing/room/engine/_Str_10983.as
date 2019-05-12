package com.sulake.habbo.communication.messages.outgoing.room.engine
{
    import com.sulake.core.communication.messages.IMessageComposer;

    public class _Str_10983 implements IMessageComposer 
    {
        private var _Str_2388:int;

        public function _Str_10983(k:int)
        {
            this._Str_2388 = k;
        }

        public function getMessageArray():Array
        {
            return [this._Str_2388];
        }

        public function dispose():void
        {
        }
    }
}
