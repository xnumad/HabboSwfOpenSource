package com.sulake.habbo.communication.messages.outgoing.catalog
{
    import com.sulake.core.communication.messages.IMessageComposer;

    public class GetCatalogPageWithEarliestExpiryComposer implements IMessageComposer
    {
        public function dispose():void
        {
        }

        public function getMessageArray():Array
        {
            return [];
        }
    }
}
