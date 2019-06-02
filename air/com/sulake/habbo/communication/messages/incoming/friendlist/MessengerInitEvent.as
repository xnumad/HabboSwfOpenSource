//com.sulake.habbo.communication.messages.incoming.friendlist.MessengerInitEvent

package com.sulake.habbo.communication.messages.incoming.friendlist{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.friendlist.MessengerInitMessageParser;

    [SecureSWF(rename="true")]
    public class MessengerInitEvent extends MessageEvent implements IMessageEvent {

        public function MessengerInitEvent(k:Function);

        public function getParser():MessengerInitMessageParser;


    }
}//package com.sulake.habbo.communication.messages.incoming.friendlist

