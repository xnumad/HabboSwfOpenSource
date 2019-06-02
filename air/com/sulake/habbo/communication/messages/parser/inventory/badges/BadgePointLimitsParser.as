//com.sulake.habbo.communication.messages.parser.inventory.badges.BadgePointLimitsParser

package com.sulake.habbo.communication.messages.parser.inventory.badges{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class BadgePointLimitsParser implements IMessageParser {

        private var _data:Array;

        public function BadgePointLimitsParser();

        public function flush():Boolean;

        public function parse(k:IMessageDataWrapper):Boolean;

        public function get data():Array;


    }
}//package com.sulake.habbo.communication.messages.parser.inventory.badges

