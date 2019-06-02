//com.sulake.habbo.communication.messages.parser.handshake.InitCryptoMessageParser

package com.sulake.habbo.communication.messages.parser.handshake{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class InitCryptoMessageParser implements IMessageParser {

        protected var _isClientEncrypted:Boolean;
        protected var _isServerEncrypted:Boolean;
        protected var _token:String;

        public function InitCryptoMessageParser();

        public function flush():Boolean;

        public function parse(k:IMessageDataWrapper):Boolean;

        public function get token():String;

        public function get isServerEncrypted():Boolean;

        public function get isClientEncrypted():Boolean;


    }
}//package com.sulake.habbo.communication.messages.parser.handshake

