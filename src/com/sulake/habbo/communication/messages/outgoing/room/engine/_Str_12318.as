package com.sulake.habbo.communication.messages.outgoing.room.engine
{
    import com.sulake.core.communication.messages.IMessageComposer;

    public class _Str_12318 implements IMessageComposer 
    {
        private var _Str_2388:int;

        public function _Str_12318(k:int)
        {
            this._Str_2388 = k;
        }

        public function dispose():void
        {
        }

        public function getMessageArray():Array
        {
            return [this._Str_2388];
        }
    }
}
