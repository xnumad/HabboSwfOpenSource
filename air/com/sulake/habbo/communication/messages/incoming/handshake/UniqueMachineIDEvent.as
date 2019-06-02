//com.sulake.habbo.communication.messages.incoming.handshake.UniqueMachineIDEvent

package com.sulake.habbo.communication.messages.incoming.handshake{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.handshake.UniqueMachineIDParser;

    [SecureSWF(rename="true")]
    public class UniqueMachineIDEvent extends MessageEvent implements IMessageEvent {

        public function UniqueMachineIDEvent(k:Function);

        private function getParser():UniqueMachineIDParser;

        public function get machineID():String;


    }
}//package com.sulake.habbo.communication.messages.incoming.handshake

