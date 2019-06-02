//com.sulake.habbo.communication.messages.outgoing.handshake.SSOTicketMessageComposer

package com.sulake.habbo.communication.messages.outgoing.handshake{
    import com.sulake.core.communication.messages.IMessageComposer;

    [SecureSWF(rename="true")]
    public class SSOTicketMessageComposer implements IMessageComposer {

        private var _message:Array;

        public function SSOTicketMessageComposer(k:String);

        public function dispose():void;

        public function getMessageArray():Array;


    }
}//package com.sulake.habbo.communication.messages.outgoing.handshake

