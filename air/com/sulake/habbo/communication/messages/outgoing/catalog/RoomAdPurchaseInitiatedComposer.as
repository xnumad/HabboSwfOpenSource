//com.sulake.habbo.communication.messages.outgoing.catalog.RoomAdPurchaseInitiatedComposer

package com.sulake.habbo.communication.messages.outgoing.catalog{
    import com.sulake.core.communication.messages.IMessageComposer;

    [SecureSWF(rename="true")]
    public class RoomAdPurchaseInitiatedComposer implements IMessageComposer {

        public function RoomAdPurchaseInitiatedComposer();

        public function getMessageArray():Array;

        public function dispose():void;


    }
}//package com.sulake.habbo.communication.messages.outgoing.catalog

