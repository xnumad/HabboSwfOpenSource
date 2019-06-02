//com.sulake.habbo.communication.messages.outgoing.inventory.furni.RequestFurniInventoryWhenNotInRoomComposer

package com.sulake.habbo.communication.messages.outgoing.inventory.furni{
    import com.sulake.core.communication.messages.IMessageComposer;

    [SecureSWF(rename="true")]
    public class RequestFurniInventoryWhenNotInRoomComposer implements IMessageComposer {

        public function RequestFurniInventoryWhenNotInRoomComposer();

        public function dispose():void;

        public function getMessageArray():Array;


    }
}//package com.sulake.habbo.communication.messages.outgoing.inventory.furni

