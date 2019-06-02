//com.sulake.habbo.communication.messages.outgoing.room.engine.RemovePetFromFlatMessageComposer

package com.sulake.habbo.communication.messages.outgoing.room.engine{
    import com.sulake.core.communication.messages.IMessageComposer;

    [SecureSWF(rename="true")]
    public class RemovePetFromFlatMessageComposer implements IMessageComposer {

        private var _petId:int;

        public function RemovePetFromFlatMessageComposer(k:int);

        public function dispose():void;

        public function getMessageArray():Array;


    }
}//package com.sulake.habbo.communication.messages.outgoing.room.engine

