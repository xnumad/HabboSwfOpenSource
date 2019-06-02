//com.sulake.habbo.communication.messages.incoming.userdefinedroomevents.WiredValidationErrorEvent

package com.sulake.habbo.communication.messages.incoming.userdefinedroomevents{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.userdefinedroomevents.WiredValidationErrorParser;

    public class WiredValidationErrorEvent extends MessageEvent implements IMessageEvent {

        public function WiredValidationErrorEvent(k:Function);

        public function getParser():WiredValidationErrorParser;


    }
}//package com.sulake.habbo.communication.messages.incoming.userdefinedroomevents

