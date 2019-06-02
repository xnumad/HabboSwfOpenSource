//com.sulake.habbo.communication.messages.outgoing.room.pets.CustomizePetWithFurniComposer

package com.sulake.habbo.communication.messages.outgoing.room.pets{
    import com.sulake.core.communication.messages.IMessageComposer;

    [SecureSWF(rename="true")]
    public class CustomizePetWithFurniComposer implements IMessageComposer {

        private var _data:Array;

        public function CustomizePetWithFurniComposer(k:int, _arg_2:int);

        public function getMessageArray():Array;

        public function dispose():void;


    }
}//package com.sulake.habbo.communication.messages.outgoing.room.pets

