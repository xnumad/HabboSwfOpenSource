//com.sulake.habbo.communication.messages.parser.handshake.SecretKeyMessageParser

package com.sulake.habbo.communication.messages.parser.handshake{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class SecretKeyMessageParser implements IMessageParser {

        protected var _serverPublicKey:String;

        public function SecretKeyMessageParser();

        public function flush():Boolean;

        public function parse(k:IMessageDataWrapper):Boolean;

        public function get serverPublicKey():String;


    }
}//package com.sulake.habbo.communication.messages.parser.handshake

