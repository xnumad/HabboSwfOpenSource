//com.sulake.habbo.communication.messages.outgoing.room.engine.RemoveSaddleFromPetMessageComposer

package com.sulake.habbo.communication.messages.outgoing.room.engine{
    import com.sulake.core.communication.messages.IMessageComposer;

    [SecureSWF(rename="true")]
    public class RemoveSaddleFromPetMessageComposer implements IMessageComposer {

        private var _petId:int;

        public function RemoveSaddleFromPetMessageComposer(k:int);

        public function getMessageArray():Array;

        public function dispose():void;


    }
}//package com.sulake.habbo.communication.messages.outgoing.room.engine

