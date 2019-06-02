//com.sulake.habbo.communication.messages.outgoing.handshake.TryLoginMessageComposer

package com.sulake.habbo.communication.messages.outgoing.handshake{
    import com.sulake.core.communication.messages.IMessageComposer;

    [SecureSWF(rename="true")]
    public class TryLoginMessageComposer implements IMessageComposer {

        private var _username:String;
        private var _password:String;
        private var _userId:int;

        public function TryLoginMessageComposer(k:String, _arg_2:String, _arg_3:int);

        public function dispose():void;

        public function getMessageArray():Array;


    }
}//package com.sulake.habbo.communication.messages.outgoing.handshake

