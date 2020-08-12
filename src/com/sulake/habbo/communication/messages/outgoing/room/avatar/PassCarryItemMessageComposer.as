package com.sulake.habbo.communication.messages.outgoing.room.avatar
{
    import com.sulake.core.communication.messages.IMessageComposer;

    public class PassCarryItemMessageComposer implements IMessageComposer
    {
        private var _Str_2306:int;

        public function PassCarryItemMessageComposer(k:int)
        {
            this._Str_2306 = k;
        }

        public function dispose():void
        {
        }

        public function getMessageArray():Array
        {
            return [this._Str_2306];
        }
    }
}
