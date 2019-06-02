//com.sulake.habbo.communication.messages.outgoing.room.pets.PetSelectedMessageComposer

package com.sulake.habbo.communication.messages.outgoing.room.pets{
    import com.sulake.core.communication.messages.IMessageComposer;

    public class PetSelectedMessageComposer implements IMessageComposer {

        private var _petId:int;

        public function PetSelectedMessageComposer(k:int);

        public function getMessageArray():Array;

        public function dispose():void;


    }
}//package com.sulake.habbo.communication.messages.outgoing.room.pets

