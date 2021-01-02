package com.sulake.habbo.communication.messages.outgoing.catalog
{
    import com.sulake.core.communication.messages.IMessageComposer;

    public class GetNextTargetedOfferComposer implements IMessageComposer
    {
        private var _array:Array;

        public function GetNextTargetedOfferComposer()
        {
            this._array = [];
            super();
        }

        public function getMessageArray():Array
        {
            return this._array;
        }

        public function dispose():void
        {
            this._array = null;
        }
    }
}
