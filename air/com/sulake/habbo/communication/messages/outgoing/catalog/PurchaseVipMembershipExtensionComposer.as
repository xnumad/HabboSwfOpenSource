//com.sulake.habbo.communication.messages.outgoing.catalog.PurchaseVipMembershipExtensionComposer

package com.sulake.habbo.communication.messages.outgoing.catalog{
    import com.sulake.core.communication.messages.IMessageComposer;

    [SecureSWF(rename="true")]
    public class PurchaseVipMembershipExtensionComposer implements IMessageComposer {

        private var _data:Array;

        public function PurchaseVipMembershipExtensionComposer(k:int);

        public function dispose():void;

        public function getMessageArray():Array;


    }
}//package com.sulake.habbo.communication.messages.outgoing.catalog

