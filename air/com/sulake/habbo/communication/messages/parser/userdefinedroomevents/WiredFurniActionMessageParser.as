//com.sulake.habbo.communication.messages.parser.userdefinedroomevents.WiredFurniActionMessageParser

package com.sulake.habbo.communication.messages.parser.userdefinedroomevents{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.habbo.communication.messages.incoming.userdefinedroomevents.ActionDefinition;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class WiredFurniActionMessageParser implements IMessageParser {

        private var _def:ActionDefinition;

        public function WiredFurniActionMessageParser();

        public function flush():Boolean;

        public function parse(k:IMessageDataWrapper):Boolean;

        public function get def():ActionDefinition;


    }
}//package com.sulake.habbo.communication.messages.parser.userdefinedroomevents

