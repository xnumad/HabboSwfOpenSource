package com.sulake.habbo.communication.messages.outgoing.marketplace
{
    import com.sulake.core.communication.messages.IMessageComposer;
    import com.sulake.core.runtime.IDisposable;

    public class GetMarketplaceItemStatsComposer implements IMessageComposer, IDisposable
    {
        private var _array:Array;

        public function GetMarketplaceItemStatsComposer(itemType:int, itemId:int)
        {
            this._array = new Array();
            super();
            this._array.push(itemType);
            this._array.push(itemId);
        }

        public function getMessageArray():Array
        {
            return this._array;
        }

        public function dispose():void
        {
            this._array = null;
        }

        public function get disposed():Boolean
        {
            return false;
        }
    }
}
