//com.sulake.habbo.communication.messages.outgoing.inventory.pets.ConfirmPetBreedingComposer

package com.sulake.habbo.communication.messages.outgoing.inventory.pets{
    import com.sulake.core.communication.messages.IMessageComposer;

    public class ConfirmPetBreedingComposer implements IMessageComposer {

        private var _data:Array;

        public function ConfirmPetBreedingComposer(k:int, _arg_2:String, _arg_3:int, _arg_4:int);

        public function getMessageArray():Array;

        public function dispose():void;


    }
}//package com.sulake.habbo.communication.messages.outgoing.inventory.pets

