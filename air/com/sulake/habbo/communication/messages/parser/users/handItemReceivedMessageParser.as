//com.sulake.habbo.communication.messages.parser.users.handItemReceivedMessageParser

package com.sulake.habbo.communication.messages.parser.users{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class handItemReceivedMessageParser implements IMessageParser {

        private var _giverUserId:int;
        private var _handItemType:int;

        public function handItemReceivedMessageParser();

        public function get giverUserId():int;

        public function get handItemType():int;

        public function flush():Boolean;

        public function parse(k:IMessageDataWrapper):Boolean;


    }
}//package com.sulake.habbo.communication.messages.parser.users

