//com.sulake.habbo.communication.messages.parser.userdefinedroomevents.WiredFurniTriggerMessageParser

package com.sulake.habbo.communication.messages.parser.userdefinedroomevents{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.habbo.communication.messages.incoming.userdefinedroomevents.TriggerDefinition;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class WiredFurniTriggerMessageParser implements IMessageParser {

        private var _def:TriggerDefinition;

        public function WiredFurniTriggerMessageParser();

        public function flush():Boolean;

        public function parse(k:IMessageDataWrapper):Boolean;

        public function get def():TriggerDefinition;


    }
}//package com.sulake.habbo.communication.messages.parser.userdefinedroomevents

