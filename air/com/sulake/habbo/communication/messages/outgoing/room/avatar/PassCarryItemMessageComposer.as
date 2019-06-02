//com.sulake.habbo.communication.messages.outgoing.room.avatar.PassCarryItemMessageComposer

package com.sulake.habbo.communication.messages.outgoing.room.avatar{
    import com.sulake.core.communication.messages.IMessageComposer;

    [SecureSWF(rename="true")]
    public class PassCarryItemMessageComposer implements IMessageComposer {

        private var _userId:int;

        public function PassCarryItemMessageComposer(k:int);

        public function dispose():void;

        public function getMessageArray():Array;


    }
}//package com.sulake.habbo.communication.messages.outgoing.room.avatar

