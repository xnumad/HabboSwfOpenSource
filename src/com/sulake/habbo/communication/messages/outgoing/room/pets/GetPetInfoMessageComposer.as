package com.sulake.habbo.communication.messages.outgoing.room.pets
{
    import com.sulake.core.communication.messages.IMessageComposer;

    public class GetPetInfoMessageComposer implements IMessageComposer
    {
        private var _petId:int;

        public function GetPetInfoMessageComposer(k:int)
        {
            this._petId = k;
        }

        public function getMessageArray():Array
        {
            return [this._petId];
        }

        public function dispose():void
        {
        }
    }
}
