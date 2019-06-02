//com.sulake.habbo.communication.messages.incoming.facebook.FaceBookAuthenticateEvent

package com.sulake.habbo.communication.messages.incoming.facebook{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.facebook.FaceBookAuthenticateMessageParser;

    [SecureSWF(rename="true")]
    public class FaceBookAuthenticateEvent extends MessageEvent implements IMessageEvent {

        public function FaceBookAuthenticateEvent(k:Function);

        public function getParser():FaceBookAuthenticateMessageParser;


    }
}//package com.sulake.habbo.communication.messages.incoming.facebook

