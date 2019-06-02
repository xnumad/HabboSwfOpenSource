//com.sulake.habbo.communication.messages.incoming.userdefinedroomevents.WiredFurniConditionEvent

package com.sulake.habbo.communication.messages.incoming.userdefinedroomevents{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.userdefinedroomevents.WiredFurniConditionMessageParser;

    [SecureSWF(rename="true")]
    public class WiredFurniConditionEvent extends MessageEvent implements IMessageEvent {

        public function WiredFurniConditionEvent(k:Function);

        public function getParser():WiredFurniConditionMessageParser;


    }
}//package com.sulake.habbo.communication.messages.incoming.userdefinedroomevents

