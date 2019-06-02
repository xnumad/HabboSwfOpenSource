//com.sulake.habbo.communication.messages.outgoing.tracking.LatencyPingRequestMessageComposer

package com.sulake.habbo.communication.messages.outgoing.tracking{
    import com.sulake.core.communication.messages.IMessageComposer;

    [SecureSWF(rename="true")]
    public class LatencyPingRequestMessageComposer implements IMessageComposer {

        private var _id:int;

        public function LatencyPingRequestMessageComposer(k:int);

        public function getMessageArray():Array;

        public function dispose():void;


    }
}//package com.sulake.habbo.communication.messages.outgoing.tracking

