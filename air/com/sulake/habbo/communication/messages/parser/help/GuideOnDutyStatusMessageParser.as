//com.sulake.habbo.communication.messages.parser.help.GuideOnDutyStatusMessageParser

package com.sulake.habbo.communication.messages.parser.help{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class GuideOnDutyStatusMessageParser implements IMessageParser {

        private var _onDuty:Boolean;
        private var _guidesOnDuty:int;
        private var _helpersOnDuty:int;
        private var _guardiansOnDuty:int;

        public function GuideOnDutyStatusMessageParser();

        public function flush():Boolean;

        public function parse(k:IMessageDataWrapper):Boolean;

        public function get onDuty():Boolean;

        public function get helpersOnDuty():int;

        public function get guardiansOnDuty():int;

        public function get guidesOnDuty():int;


    }
}//package com.sulake.habbo.communication.messages.parser.help

