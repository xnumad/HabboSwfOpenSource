//com.sulake.habbo.communication.messages.outgoing.marketplace.GetMarketplaceConfigurationMessageComposer

package com.sulake.habbo.communication.messages.outgoing.marketplace{
    import com.sulake.core.communication.messages.IMessageComposer;

    [SecureSWF(rename="true")]
    public class GetMarketplaceConfigurationMessageComposer implements IMessageComposer {

        public function GetMarketplaceConfigurationMessageComposer();

        public function getMessageArray():Array;

        public function dispose():void;


    }
}//package com.sulake.habbo.communication.messages.outgoing.marketplace

