package com.sulake.habbo.communication.messages.outgoing.catalog
{
    import com.sulake.core.communication.messages.IMessageComposer;

    public class GetDirectClubBuyAvailableComposer implements IMessageComposer
    {
        private var _days:int;

        public function GetDirectClubBuyAvailableComposer(k:int)
        {
            this._days = k;
        }

        public function getMessageArray():Array
        {
            return [this._days];
        }

        public function dispose():void
        {
        }
    }
}
