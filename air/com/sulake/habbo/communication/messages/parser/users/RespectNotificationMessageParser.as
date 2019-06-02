//com.sulake.habbo.communication.messages.parser.users.RespectNotificationMessageParser

package com.sulake.habbo.communication.messages.parser.users{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class RespectNotificationMessageParser implements IMessageParser {

        private var _userId:int;
        private var _respectTotal:int;

        public function RespectNotificationMessageParser();

        public function flush():Boolean;

        public function parse(k:IMessageDataWrapper):Boolean;

        public function get userId():int;

        public function get respectTotal():int;


    }
}//package com.sulake.habbo.communication.messages.parser.users

