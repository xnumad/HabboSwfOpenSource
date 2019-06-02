//com.sulake.habbo.communication.messages.incoming.catalog.LimitedEditionSoldOutEvent

package com.sulake.habbo.communication.messages.incoming.catalog{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.catalog.LimitedEditionSoldOutParser;

    [SecureSWF(rename="true")]
    public class LimitedEditionSoldOutEvent extends MessageEvent implements IMessageEvent {

        public function LimitedEditionSoldOutEvent(k:Function);

        public function getParser():LimitedEditionSoldOutParser;


    }
}//package com.sulake.habbo.communication.messages.incoming.catalog

