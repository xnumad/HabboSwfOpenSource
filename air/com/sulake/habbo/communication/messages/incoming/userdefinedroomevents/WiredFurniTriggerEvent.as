//com.sulake.habbo.communication.messages.incoming.userdefinedroomevents.WiredFurniTriggerEvent

package com.sulake.habbo.communication.messages.incoming.userdefinedroomevents{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.userdefinedroomevents.WiredFurniTriggerMessageParser;

    [SecureSWF(rename="true")]
    public class WiredFurniTriggerEvent extends MessageEvent implements IMessageEvent {

        public function WiredFurniTriggerEvent(k:Function);

        public function getParser():WiredFurniTriggerMessageParser;


    }
}//package com.sulake.habbo.communication.messages.incoming.userdefinedroomevents

