//com.sulake.habbo.communication.messages.outgoing.marketplace.CancelMarketplaceOfferMessageComposer

package com.sulake.habbo.communication.messages.outgoing.marketplace{
    import com.sulake.core.communication.messages.IMessageComposer;
    import com.sulake.core.runtime.IDisposable;

    [SecureSWF(rename="true")]
    public class CancelMarketplaceOfferMessageComposer implements IMessageComposer, IDisposable {

        private var _array:Array;

        public function CancelMarketplaceOfferMessageComposer(k:int);

        public function getMessageArray():Array;

        public function dispose():void;

        public function get disposed():Boolean;


    }
}//package com.sulake.habbo.communication.messages.outgoing.marketplace

