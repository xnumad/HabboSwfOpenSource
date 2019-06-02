//com.sulake.habbo.communication.messages.incoming.friendlist.InstantMessageErrorEvent

package com.sulake.habbo.communication.messages.incoming.friendlist{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.friendlist.InstantMessageErrorMessageParser;

    [SecureSWF(rename="true")]
    public class InstantMessageErrorEvent extends MessageEvent implements IMessageEvent {

        public function InstantMessageErrorEvent(k:Function);

        public function getParser():InstantMessageErrorMessageParser;


    }
}//package com.sulake.habbo.communication.messages.incoming.friendlist

