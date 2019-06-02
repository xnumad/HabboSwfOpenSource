//com.sulake.habbo.communication.messages.outgoing.room.pets.GetPetInfoMessageComposer

package com.sulake.habbo.communication.messages.outgoing.room.pets{
    import com.sulake.core.communication.messages.IMessageComposer;

    [SecureSWF(rename="true")]
    public class GetPetInfoMessageComposer implements IMessageComposer {

        private var _petId:int;

        public function GetPetInfoMessageComposer(k:int);

        public function getMessageArray():Array;

        public function dispose():void;


    }
}//package com.sulake.habbo.communication.messages.outgoing.room.pets

