//com.sulake.habbo.communication.messages.parser.catalog.NotEnoughBalanceMessageParser

package com.sulake.habbo.communication.messages.parser.catalog{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class NotEnoughBalanceMessageParser implements IMessageParser {

        private var _notEnoughCredits:Boolean;
        private var _notEnoughActivityPoints:Boolean;
        private var _activityPointType:int;

        public function NotEnoughBalanceMessageParser();

        public function get notEnoughCredits():Boolean;

        public function get notEnoughActivityPoints():Boolean;

        public function get activityPointType():int;

        public function flush():Boolean;

        public function parse(k:IMessageDataWrapper):Boolean;


    }
}//package com.sulake.habbo.communication.messages.parser.catalog

