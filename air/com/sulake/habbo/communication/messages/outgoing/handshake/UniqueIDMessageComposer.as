//com.sulake.habbo.communication.messages.outgoing.handshake.UniqueIDMessageComposer

package com.sulake.habbo.communication.messages.outgoing.handshake{
    import com.sulake.core.communication.messages.IMessageComposer;

    [SecureSWF(rename="true")]
    public class UniqueIDMessageComposer implements IMessageComposer {

        private var _machineID:String;
        private var _fingerprint:String;

        public function UniqueIDMessageComposer(k:String, _arg_2:String);

        public function dispose():void;

        public function getMessageArray():Array;


    }
}//package com.sulake.habbo.communication.messages.outgoing.handshake

