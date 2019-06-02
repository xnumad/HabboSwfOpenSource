//com.sulake.habbo.communication.messages.outgoing.room.avatar.PassCarryItemToPetMessageComposer

package com.sulake.habbo.communication.messages.outgoing.room.avatar{
    import com.sulake.core.communication.messages.IMessageComposer;

    [SecureSWF(rename="true")]
    public class PassCarryItemToPetMessageComposer implements IMessageComposer {

        private var _petId:int;

        public function PassCarryItemToPetMessageComposer(k:int);

        public function dispose():void;

        public function getMessageArray():Array;


    }
}//package com.sulake.habbo.communication.messages.outgoing.room.avatar

