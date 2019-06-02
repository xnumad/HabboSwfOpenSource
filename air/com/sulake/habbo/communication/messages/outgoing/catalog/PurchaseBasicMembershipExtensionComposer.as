//com.sulake.habbo.communication.messages.outgoing.catalog.PurchaseBasicMembershipExtensionComposer

package com.sulake.habbo.communication.messages.outgoing.catalog{
    import com.sulake.core.communication.messages.IMessageComposer;

    [SecureSWF(rename="true")]
    public class PurchaseBasicMembershipExtensionComposer implements IMessageComposer {

        private var _data:Array;

        public function PurchaseBasicMembershipExtensionComposer(k:int);

        public function dispose():void;

        public function getMessageArray():Array;


    }
}//package com.sulake.habbo.communication.messages.outgoing.catalog

