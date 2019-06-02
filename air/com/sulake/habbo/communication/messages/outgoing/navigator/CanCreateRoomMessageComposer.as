//com.sulake.habbo.communication.messages.outgoing.navigator.CanCreateRoomMessageComposer

package com.sulake.habbo.communication.messages.outgoing.navigator{
    import com.sulake.core.communication.messages.IMessageComposer;

    [SecureSWF(rename="true")]
    public class CanCreateRoomMessageComposer implements IMessageComposer {

        public function CanCreateRoomMessageComposer();

        public function dispose():void;

        public function getMessageArray():Array;


    }
}//package com.sulake.habbo.communication.messages.outgoing.navigator

