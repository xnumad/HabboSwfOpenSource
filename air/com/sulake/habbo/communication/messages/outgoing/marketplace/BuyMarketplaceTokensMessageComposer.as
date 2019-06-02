//com.sulake.habbo.communication.messages.outgoing.marketplace.BuyMarketplaceTokensMessageComposer

package com.sulake.habbo.communication.messages.outgoing.marketplace{
    import com.sulake.core.communication.messages.IMessageComposer;

    [SecureSWF(rename="true")]
    public class BuyMarketplaceTokensMessageComposer implements IMessageComposer {

        public function BuyMarketplaceTokensMessageComposer();

        public function getMessageArray():Array;

        public function dispose():void;


    }
}//package com.sulake.habbo.communication.messages.outgoing.marketplace

