package com.sulake.habbo.communication.messages.outgoing.catalog
{
    import com.sulake.core.communication.messages.IMessageComposer;

    public class GetTargetedOfferComposer implements IMessageComposer
    {
        private var _array:Array;

        public function GetTargetedOfferComposer()
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
