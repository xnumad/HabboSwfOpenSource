//com.sulake.habbo.communication.messages.incoming.facebook.FaceBookErrorEvent

package com.sulake.habbo.communication.messages.incoming.facebook{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.facebook.FaceBookErrorMessageParser;

    [SecureSWF(rename="true")]
    public class FaceBookErrorEvent extends MessageEvent implements IMessageEvent {

        public function FaceBookErrorEvent(k:Function);

        public function getParser():FaceBookErrorMessageParser;


    }
}//package com.sulake.habbo.communication.messages.incoming.facebook

