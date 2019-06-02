//com.sulake.habbo.communication.messages.outgoing.room.engine.MountPetMessageComposer

package com.sulake.habbo.communication.messages.outgoing.room.engine{
    import com.sulake.core.communication.messages.IMessageComposer;

    [SecureSWF(rename="true")]
    public class MountPetMessageComposer implements IMessageComposer {

        private var _petId:int;
        private var _mounted:Boolean;

        public function MountPetMessageComposer(k:int, _arg_2:Boolean);

        public function dispose():void;

        public function getMessageArray():Array;


    }
}//package com.sulake.habbo.communication.messages.outgoing.room.engine

