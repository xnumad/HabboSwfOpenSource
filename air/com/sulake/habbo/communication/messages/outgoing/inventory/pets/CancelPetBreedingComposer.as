//com.sulake.habbo.communication.messages.outgoing.inventory.pets.CancelPetBreedingComposer

package com.sulake.habbo.communication.messages.outgoing.inventory.pets{
    import com.sulake.core.communication.messages.IMessageComposer;

    public class CancelPetBreedingComposer implements IMessageComposer {

        private var _data:Array;

        public function CancelPetBreedingComposer(k:int);

        public function getMessageArray():Array;

        public function dispose():void;


    }
}//package com.sulake.habbo.communication.messages.outgoing.inventory.pets

