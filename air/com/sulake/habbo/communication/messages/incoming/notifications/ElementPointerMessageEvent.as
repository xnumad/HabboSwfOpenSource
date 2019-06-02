//com.sulake.habbo.communication.messages.incoming.notifications.ElementPointerMessageEvent

package com.sulake.habbo.communication.messages.incoming.notifications{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.notifications.ElementPointerMessageParser;

    [SecureSWF(rename="true")]
    public class ElementPointerMessageEvent extends MessageEvent implements IMessageEvent {

        public function ElementPointerMessageEvent(k:Function);

        public function getParser():ElementPointerMessageParser;


    }
}//package com.sulake.habbo.communication.messages.incoming.notifications

