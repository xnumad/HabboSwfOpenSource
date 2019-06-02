//com.sulake.habbo.communication.messages.parser.room.furniture.CustomUserNotificationMessageParser

package com.sulake.habbo.communication.messages.parser.room.furniture{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class CustomUserNotificationMessageParser implements IMessageParser {

        private var _code:int;

        public function CustomUserNotificationMessageParser();

        public function get code():int;

        public function flush():Boolean;

        public function parse(k:IMessageDataWrapper):Boolean;


    }
}//package com.sulake.habbo.communication.messages.parser.room.furniture

