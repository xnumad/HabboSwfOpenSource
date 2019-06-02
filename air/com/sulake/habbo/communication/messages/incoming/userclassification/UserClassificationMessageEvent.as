//com.sulake.habbo.communication.messages.incoming.userclassification.UserClassificationMessageEvent

package com.sulake.habbo.communication.messages.incoming.userclassification{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.habbo.communication.messages.parser.userclassification.UserClassificationMessageParser;

    [SecureSWF(rename="true")]
    public class UserClassificationMessageEvent extends MessageEvent {

        public function UserClassificationMessageEvent(k:Function);

        public function getParser():UserClassificationMessageParser;


    }
}//package com.sulake.habbo.communication.messages.incoming.userclassification

