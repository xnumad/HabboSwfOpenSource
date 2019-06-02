//com.sulake.habbo.communication.messages.outgoing.room.avatar.DropCarryItemMessageComposer

package com.sulake.habbo.communication.messages.outgoing.room.avatar{
    import com.sulake.core.communication.messages.IMessageComposer;

    [SecureSWF(rename="true")]
    public class DropCarryItemMessageComposer implements IMessageComposer {

        public function DropCarryItemMessageComposer();

        public function dispose():void;

        public function getMessageArray():Array;


    }
}//package com.sulake.habbo.communication.messages.outgoing.room.avatar

