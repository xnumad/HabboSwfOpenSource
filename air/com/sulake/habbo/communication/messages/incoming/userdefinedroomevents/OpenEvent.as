//com.sulake.habbo.communication.messages.incoming.userdefinedroomevents.OpenEvent

package com.sulake.habbo.communication.messages.incoming.userdefinedroomevents{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.userdefinedroomevents.OpenMessageParser;

    [SecureSWF(rename="true")]
    public class OpenEvent extends MessageEvent implements IMessageEvent {

        public function OpenEvent(k:Function);

        public function getParser():OpenMessageParser;


    }
}//package com.sulake.habbo.communication.messages.incoming.userdefinedroomevents

