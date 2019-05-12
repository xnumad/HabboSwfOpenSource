package com.sulake.habbo.communication.messages.outgoing.room.furniture
{
    import com.sulake.core.communication.messages.IMessageComposer;

    public class _Str_9716 implements IMessageComposer 
    {
        private var _Str_2156:Array;

        public function _Str_9716(k:int)
        {
            this._Str_2156 = [k];
        }

        public function getMessageArray():Array
        {
            return this._Str_2156;
        }

        public function dispose():void
        {
            this._Str_2156 = null;
        }
    }
}
