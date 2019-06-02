//com.sulake.habbo.communication.messages.parser.handshake.DisconnectReasonParser

package com.sulake.habbo.communication.messages.parser.handshake{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class DisconnectReasonParser implements IMessageParser {

        private var _reason:int;

        public function DisconnectReasonParser();

        public function flush():Boolean;

        public function parse(k:IMessageDataWrapper):Boolean;

        public function get reason():int;


    }
}//package com.sulake.habbo.communication.messages.parser.handshake

