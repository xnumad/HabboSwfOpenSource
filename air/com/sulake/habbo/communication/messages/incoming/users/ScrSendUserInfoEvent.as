//com.sulake.habbo.communication.messages.incoming.users.ScrSendUserInfoEvent

package com.sulake.habbo.communication.messages.incoming.users{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.users.ScrSendUserInfoMessageParser;

    [SecureSWF(rename="true")]
    public class ScrSendUserInfoEvent extends MessageEvent implements IMessageEvent {

        public function ScrSendUserInfoEvent(k:Function);

        public function getParser():ScrSendUserInfoMessageParser;


    }
}//package com.sulake.habbo.communication.messages.incoming.users

