//com.sulake.habbo.communication.messages.parser.friendlist.MessengerErrorMessageParser

package com.sulake.habbo.communication.messages.parser.friendlist{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class MessengerErrorMessageParser implements IMessageParser {

        private var _clientMessageId:int;
        private var _errorCode:int;

        public function MessengerErrorMessageParser();

        public function flush():Boolean;

        public function parse(k:IMessageDataWrapper):Boolean;

        public function get clientMessageId():int;

        public function get errorCode():int;


    }
}//package com.sulake.habbo.communication.messages.parser.friendlist

