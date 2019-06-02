//com.sulake.habbo.communication.messages.parser.handshake.UniqueMachineIDParser

package com.sulake.habbo.communication.messages.parser.handshake{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class UniqueMachineIDParser implements IMessageParser {

        private var _machineID:String;

        public function UniqueMachineIDParser();

        public function flush():Boolean;

        public function parse(k:IMessageDataWrapper):Boolean;

        public function get machineID():String;


    }
}//package com.sulake.habbo.communication.messages.parser.handshake

