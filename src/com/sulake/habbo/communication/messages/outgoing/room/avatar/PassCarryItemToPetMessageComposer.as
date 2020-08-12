package com.sulake.habbo.communication.messages.outgoing.room.avatar
{
    import com.sulake.core.communication.messages.IMessageComposer;

    public class PassCarryItemToPetMessageComposer implements IMessageComposer
    {
        private var _petId:int;

        public function PassCarryItemToPetMessageComposer(k:int)
        {
            this._petId = k;
        }

        public function dispose():void
        {
        }

        public function getMessageArray():Array
        {
            return [this._petId];
        }
    }
}
