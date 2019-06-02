//com.sulake.habbo.communication.messages.parser.handshake.AuthenticationOKMessageParser

package com.sulake.habbo.communication.messages.parser.handshake{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class AuthenticationOKMessageParser implements IMessageParser {

        public function AuthenticationOKMessageParser();

        public function flush():Boolean;

        public function parse(k:IMessageDataWrapper):Boolean;


    }
}//package com.sulake.habbo.communication.messages.parser.handshake

