//com.sulake.habbo.communication.messages.outgoing.handshake.PongMessageComposer

package com.sulake.habbo.communication.messages.outgoing.handshake{
    import com.sulake.core.communication.messages.IMessageComposer;

    [SecureSWF(rename="true")]
    public class PongMessageComposer implements IMessageComposer {

        public function PongMessageComposer();

        public function dispose():void;

        public function getMessageArray():Array;


    }
}//package com.sulake.habbo.communication.messages.outgoing.handshake

