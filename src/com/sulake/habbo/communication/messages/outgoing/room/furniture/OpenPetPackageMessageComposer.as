package com.sulake.habbo.communication.messages.outgoing.room.furniture
{
    import com.sulake.core.communication.messages.IMessageComposer;

    public class OpenPetPackageMessageComposer implements IMessageComposer
    {
        private var _objectId:int;
        private var _petName:String;

        public function OpenPetPackageMessageComposer(k:int, _arg_2:String)
        {
            this._objectId = k;
            this._petName = _arg_2;
        }

        public function getMessageArray():Array
        {
            return [this._objectId, this._petName];
        }

        public function dispose():void
        {
        }
    }
}
