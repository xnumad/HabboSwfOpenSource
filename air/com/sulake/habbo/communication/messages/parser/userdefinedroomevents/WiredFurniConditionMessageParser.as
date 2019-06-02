//com.sulake.habbo.communication.messages.parser.userdefinedroomevents.WiredFurniConditionMessageParser

package com.sulake.habbo.communication.messages.parser.userdefinedroomevents{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.habbo.communication.messages.incoming.userdefinedroomevents.ConditionDefinition;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class WiredFurniConditionMessageParser implements IMessageParser {

        private var _def:ConditionDefinition;

        public function WiredFurniConditionMessageParser();

        public function flush():Boolean;

        public function parse(k:IMessageDataWrapper):Boolean;

        public function get def():ConditionDefinition;


    }
}//package com.sulake.habbo.communication.messages.parser.userdefinedroomevents

