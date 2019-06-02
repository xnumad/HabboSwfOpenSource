//com.sulake.habbo.communication.messages.outgoing.room.engine.GetPetCommandsMessageComposer

package com.sulake.habbo.communication.messages.outgoing.room.engine{
    import com.sulake.core.communication.messages.IMessageComposer;

    [SecureSWF(rename="true")]
    public class GetPetCommandsMessageComposer implements IMessageComposer {

        private var _petId:int;

        public function GetPetCommandsMessageComposer(k:int);

        public function dispose():void;

        public function getMessageArray():Array;


    }
}//package com.sulake.habbo.communication.messages.outgoing.room.engine

