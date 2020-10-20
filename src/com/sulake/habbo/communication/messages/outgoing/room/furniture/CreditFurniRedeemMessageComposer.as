package com.sulake.habbo.communication.messages.outgoing.room.furniture
{
    import com.sulake.core.communication.messages.IMessageComposer;

    public class CreditFurniRedeemMessageComposer implements IMessageComposer
    {
        private var _objectId:int;

        public function CreditFurniRedeemMessageComposer(k:int)
        {
            this._objectId = k;
        }

        public function dispose():void
        {
        }

        public function getMessageArray():Array
        {
            return [this._objectId];
        }
    }
}
