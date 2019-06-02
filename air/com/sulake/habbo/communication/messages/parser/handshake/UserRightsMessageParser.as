//com.sulake.habbo.communication.messages.parser.handshake.UserRightsMessageParser

package com.sulake.habbo.communication.messages.parser.handshake{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class UserRightsMessageParser implements IMessageParser {

        private var _clubLevel:int;
        private var _securityLevel:int;
        private var _noobnessLevel:int;

        public function UserRightsMessageParser();

        public function flush():Boolean;

        public function parse(k:IMessageDataWrapper):Boolean;

        public function get clubLevel():int;

        public function get securityLevel():int;

        public function get noobnessLevel():int;


    }
}//package com.sulake.habbo.communication.messages.parser.handshake

