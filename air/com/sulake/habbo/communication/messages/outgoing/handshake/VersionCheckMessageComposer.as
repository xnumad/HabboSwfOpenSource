//com.sulake.habbo.communication.messages.outgoing.handshake.VersionCheckMessageComposer

package com.sulake.habbo.communication.messages.outgoing.handshake{
    import com.sulake.core.communication.messages.IMessageComposer;

    [SecureSWF(rename="true")]
    public class VersionCheckMessageComposer implements IMessageComposer {

        private var _clientID:int;
        private var _clientURL:String;
        private var _externalVariablesURL:String;

        public function VersionCheckMessageComposer(k:int, _arg_2:String, _arg_3:String);

        public function dispose():void;

        public function getMessageArray():Array;


    }
}//package com.sulake.habbo.communication.messages.outgoing.handshake

