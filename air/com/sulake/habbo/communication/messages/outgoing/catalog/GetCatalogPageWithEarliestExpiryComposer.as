//com.sulake.habbo.communication.messages.outgoing.catalog.GetCatalogPageWithEarliestExpiryComposer

package com.sulake.habbo.communication.messages.outgoing.catalog{
    import com.sulake.core.communication.messages.IMessageComposer;

    [SecureSWF(rename="true")]
    public class GetCatalogPageWithEarliestExpiryComposer implements IMessageComposer {

        public function GetCatalogPageWithEarliestExpiryComposer();

        public function dispose():void;

        public function getMessageArray():Array;


    }
}//package com.sulake.habbo.communication.messages.outgoing.catalog

