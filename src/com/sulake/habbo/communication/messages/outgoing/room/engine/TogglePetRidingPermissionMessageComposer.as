package com.sulake.habbo.communication.messages.outgoing.room.engine
{
    import com.sulake.core.communication.messages.IMessageComposer;

    public class TogglePetRidingPermissionMessageComposer implements IMessageComposer
    {
        private var _petId:int;

        public function TogglePetRidingPermissionMessageComposer(k:int)
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
