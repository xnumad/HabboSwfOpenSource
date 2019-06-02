//com.sulake.habbo.communication.messages.outgoing.room.pets.BreedPetsMessageComposer

package com.sulake.habbo.communication.messages.outgoing.room.pets{
    import com.sulake.core.communication.messages.IMessageComposer;

    public class BreedPetsMessageComposer implements IMessageComposer {

        public static const STATE_START:int;
        public static const STATE_CANCEL:int;
        public static const STATE_ACCEPT:int;

        private var _data:Array;

        public function BreedPetsMessageComposer(k:int, _arg_2:int, _arg_3:int);

        public function getMessageArray():Array;

        public function dispose():void;


    }
}//package com.sulake.habbo.communication.messages.outgoing.room.pets

