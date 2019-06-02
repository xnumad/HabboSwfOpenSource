//com.sulake.habbo.communication.messages.outgoing.inventory.pets.GetPetInventoryComposer

package com.sulake.habbo.communication.messages.outgoing.inventory.pets{
    import com.sulake.core.communication.messages.IMessageComposer;

    [SecureSWF(rename="true")]
    public class GetPetInventoryComposer implements IMessageComposer {

        public function GetPetInventoryComposer();

        public function dispose():void;

        public function getMessageArray():Array;


    }
}//package com.sulake.habbo.communication.messages.outgoing.inventory.pets

