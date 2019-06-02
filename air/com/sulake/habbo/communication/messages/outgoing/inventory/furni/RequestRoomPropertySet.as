//com.sulake.habbo.communication.messages.outgoing.inventory.furni.RequestRoomPropertySet

package com.sulake.habbo.communication.messages.outgoing.inventory.furni{
    import com.sulake.core.communication.messages.IMessageComposer;

    [SecureSWF(rename="true")]
    public class RequestRoomPropertySet implements IMessageComposer {

        private var _stripId:int;

        public function RequestRoomPropertySet(k:int);

        public function dispose():void;

        public function getMessageArray():Array;


    }
}//package com.sulake.habbo.communication.messages.outgoing.inventory.furni

