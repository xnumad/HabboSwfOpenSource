//com.sulake.habbo.communication.messages.incoming.userdefinedroomevents.WiredFurniActionEvent

package com.sulake.habbo.communication.messages.incoming.userdefinedroomevents{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.userdefinedroomevents.WiredFurniActionMessageParser;

    [SecureSWF(rename="true")]
    public class WiredFurniActionEvent extends MessageEvent implements IMessageEvent {

        public function WiredFurniActionEvent(k:Function);

        public function getParser():WiredFurniActionMessageParser;


    }
}//package com.sulake.habbo.communication.messages.incoming.userdefinedroomevents

