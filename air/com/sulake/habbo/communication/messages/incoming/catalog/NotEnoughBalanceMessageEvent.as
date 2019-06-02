//com.sulake.habbo.communication.messages.incoming.catalog.NotEnoughBalanceMessageEvent

package com.sulake.habbo.communication.messages.incoming.catalog{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.catalog.NotEnoughBalanceMessageParser;

    [SecureSWF(rename="true")]
    public class NotEnoughBalanceMessageEvent extends MessageEvent implements IMessageEvent {

        public function NotEnoughBalanceMessageEvent(k:Function);

        public function getParser():NotEnoughBalanceMessageParser;


    }
}//package com.sulake.habbo.communication.messages.incoming.catalog

