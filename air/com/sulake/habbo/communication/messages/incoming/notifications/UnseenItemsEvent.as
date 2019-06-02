//com.sulake.habbo.communication.messages.incoming.notifications.UnseenItemsEvent

package com.sulake.habbo.communication.messages.incoming.notifications{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.notifications.UnseenItemsParser;

    [SecureSWF(rename="true")]
    public class UnseenItemsEvent extends MessageEvent implements IMessageEvent {

        public function UnseenItemsEvent(k:Function);

        public function getParser():UnseenItemsParser;


    }
}//package com.sulake.habbo.communication.messages.incoming.notifications

