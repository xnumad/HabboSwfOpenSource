//com.sulake.habbo.communication.messages.incoming.friendlist.MessengerErrorEvent

package com.sulake.habbo.communication.messages.incoming.friendlist{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.friendlist.MessengerErrorMessageParser;

    [SecureSWF(rename="true")]
    public class MessengerErrorEvent extends MessageEvent implements IMessageEvent {

        public function MessengerErrorEvent(k:Function);

        public function getParser():MessengerErrorMessageParser;


    }
}//package com.sulake.habbo.communication.messages.incoming.friendlist

