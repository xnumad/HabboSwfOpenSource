//com.sulake.habbo.communication.messages.outgoing.room.engine.GetRoomEntryDataMessageComposer

package com.sulake.habbo.communication.messages.outgoing.room.engine{
    import com.sulake.core.communication.messages.IMessageComposer;

    [SecureSWF(rename="true")]
    public class GetRoomEntryDataMessageComposer implements IMessageComposer {

        public function GetRoomEntryDataMessageComposer();

        public function dispose():void;

        public function getMessageArray():Array;


    }
}//package com.sulake.habbo.communication.messages.outgoing.room.engine

