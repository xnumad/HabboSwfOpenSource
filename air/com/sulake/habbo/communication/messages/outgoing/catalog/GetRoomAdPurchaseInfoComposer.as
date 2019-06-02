//com.sulake.habbo.communication.messages.outgoing.catalog.GetRoomAdPurchaseInfoComposer

package com.sulake.habbo.communication.messages.outgoing.catalog{
    import com.sulake.core.communication.messages.IMessageComposer;

    [SecureSWF(rename="true")]
    public class GetRoomAdPurchaseInfoComposer implements IMessageComposer {

        public function GetRoomAdPurchaseInfoComposer();

        public function getMessageArray():Array;

        public function dispose():void;


    }
}//package com.sulake.habbo.communication.messages.outgoing.catalog

