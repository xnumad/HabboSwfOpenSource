//com.sulake.habbo.communication.messages.parser.handshake.GenericErrorParser

package com.sulake.habbo.communication.messages.parser.handshake{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class GenericErrorParser implements IMessageParser {

        private var _errorCode:int;

        public function GenericErrorParser();

        public function flush():Boolean;

        public function parse(k:IMessageDataWrapper):Boolean;

        public function get errorCode():int;


    }
}//package com.sulake.habbo.communication.messages.parser.handshake

