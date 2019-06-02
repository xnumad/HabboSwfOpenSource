//com.sulake.habbo.communication.messages.outgoing.room.action.MuteAllInRoomComposer

package com.sulake.habbo.communication.messages.outgoing.room.action{
    import com.sulake.core.communication.messages.IMessageComposer;

    [SecureSWF(rename="true")]
    public class MuteAllInRoomComposer implements IMessageComposer {

        public function MuteAllInRoomComposer();

        public function getMessageArray():Array;

        public function dispose():void;


    }
}//package com.sulake.habbo.communication.messages.outgoing.room.action

