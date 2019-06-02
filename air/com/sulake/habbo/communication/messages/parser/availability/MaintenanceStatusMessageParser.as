//com.sulake.habbo.communication.messages.parser.availability.MaintenanceStatusMessageParser

package com.sulake.habbo.communication.messages.parser.availability{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class MaintenanceStatusMessageParser implements IMessageParser {

        private var _isInMaintenance:Boolean;
        private var _minutesUntilMaintenance:int;

        public function MaintenanceStatusMessageParser();

        public function get isInMaintenance():Boolean;

        public function get minutesUntilMaintenance():int;

        public function flush():Boolean;

        public function parse(k:IMessageDataWrapper):Boolean;


    }
}//package com.sulake.habbo.communication.messages.parser.availability

