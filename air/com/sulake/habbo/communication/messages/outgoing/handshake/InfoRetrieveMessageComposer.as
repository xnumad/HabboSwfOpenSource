//com.sulake.habbo.communication.messages.outgoing.handshake.InfoRetrieveMessageComposer

package com.sulake.habbo.communication.messages.outgoing.handshake{
    import com.sulake.core.communication.messages.IMessageComposer;

    [SecureSWF(rename="true")]
    public class InfoRetrieveMessageComposer implements IMessageComposer {

        public function InfoRetrieveMessageComposer();

        public function dispose():void;

        public function getMessageArray():Array;


    }
}//package com.sulake.habbo.communication.messages.outgoing.handshake

