//com.sulake.habbo.communication.messages.parser.notifications.HabboActivityPointNotificationMessageParser

package com.sulake.habbo.communication.messages.parser.notifications{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class HabboActivityPointNotificationMessageParser implements IMessageParser {

        private var _amount:int;
        private var _change:int;
        private var _type:int;

        public function HabboActivityPointNotificationMessageParser();

        public function flush():Boolean;

        public function parse(k:IMessageDataWrapper):Boolean;

        public function get amount():int;

        public function get change():int;

        public function get type():int;


    }
}//package com.sulake.habbo.communication.messages.parser.notifications

