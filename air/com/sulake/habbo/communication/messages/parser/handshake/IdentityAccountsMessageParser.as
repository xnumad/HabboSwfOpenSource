//com.sulake.habbo.communication.messages.parser.handshake.IdentityAccountsMessageParser

package com.sulake.habbo.communication.messages.parser.handshake{
    import com.sulake.core.communication.messages.IMessageParser;
    import flash.utils.Dictionary;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class IdentityAccountsMessageParser implements IMessageParser {

        private var _accounts:Dictionary;

        public function IdentityAccountsMessageParser();

        public function flush():Boolean;

        public function parse(k:IMessageDataWrapper):Boolean;

        public function get accounts():Dictionary;


    }
}//package com.sulake.habbo.communication.messages.parser.handshake

