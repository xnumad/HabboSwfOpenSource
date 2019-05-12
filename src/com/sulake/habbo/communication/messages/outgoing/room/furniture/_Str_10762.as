package com.sulake.habbo.communication.messages.outgoing.room.furniture
{
    import com.sulake.core.communication.messages.IMessageComposer;

    public class _Str_10762 implements IMessageComposer 
    {
        private var _Str_2502:int;

        public function _Str_10762(k:int)
        {
            this._Str_2502 = k;
        }

        public function getMessageArray():Array
        {
            return [this._Str_2502];
        }

        public function dispose():void
        {
        }
    }
}
