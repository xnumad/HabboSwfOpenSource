package com.sulake.habbo.communication.messages.outgoing.room.engine
{
    import com.sulake.core.communication.messages.IMessageComposer;

    public class MountPetMessageComposer implements IMessageComposer
    {
        private var _petId:int;
        private var _mounted:Boolean;

        public function MountPetMessageComposer(k:int, _arg_2:Boolean)
        {
            this._petId = k;
            this._mounted = _arg_2;
        }

        public function dispose():void
        {
        }

        public function getMessageArray():Array
        {
            return [this._petId, this._mounted];
        }
    }
}
