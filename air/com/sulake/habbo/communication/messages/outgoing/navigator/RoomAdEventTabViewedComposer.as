//com.sulake.habbo.communication.messages.outgoing.navigator.RoomAdEventTabViewedComposer

package com.sulake.habbo.communication.messages.outgoing.navigator{
    import com.sulake.core.communication.messages.IMessageComposer;

    [SecureSWF(rename="true")]
    public class RoomAdEventTabViewedComposer implements IMessageComposer {

        public function RoomAdEventTabViewedComposer();

        public function getMessageArray():Array;

        public function dispose():void;


    }
}//package com.sulake.habbo.communication.messages.outgoing.navigator

