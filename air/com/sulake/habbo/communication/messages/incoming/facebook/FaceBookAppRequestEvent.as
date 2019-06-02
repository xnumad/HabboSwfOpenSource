//com.sulake.habbo.communication.messages.incoming.facebook.FaceBookAppRequestEvent

package com.sulake.habbo.communication.messages.incoming.facebook{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.facebook.FaceBookAppRequestMessageParser;

    [SecureSWF(rename="true")]
    public class FaceBookAppRequestEvent extends MessageEvent implements IMessageEvent {

        public function FaceBookAppRequestEvent(k:Function);

        public function getParser():FaceBookAppRequestMessageParser;


    }
}//package com.sulake.habbo.communication.messages.incoming.facebook

