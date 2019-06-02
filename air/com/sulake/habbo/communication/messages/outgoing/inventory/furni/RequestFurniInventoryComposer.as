//com.sulake.habbo.communication.messages.outgoing.inventory.furni.RequestFurniInventoryComposer

package com.sulake.habbo.communication.messages.outgoing.inventory.furni{
    import com.sulake.core.communication.messages.IMessageComposer;

    [SecureSWF(rename="true")]
    public class RequestFurniInventoryComposer implements IMessageComposer {

        public function RequestFurniInventoryComposer();

        public function dispose():void;

        public function getMessageArray():Array;


    }
}//package com.sulake.habbo.communication.messages.outgoing.inventory.furni

