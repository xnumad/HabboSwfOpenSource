//com.sulake.habbo.communication.messages.incoming.userdefinedroomevents.WiredSaveSuccessEvent

package com.sulake.habbo.communication.messages.incoming.userdefinedroomevents{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.userdefinedroomevents.WiredSaveSuccessParser;

    public class WiredSaveSuccessEvent extends MessageEvent implements IMessageEvent {

        public function WiredSaveSuccessEvent(k:Function);

        public function getParser():WiredSaveSuccessParser;


    }
}//package com.sulake.habbo.communication.messages.incoming.userdefinedroomevents

