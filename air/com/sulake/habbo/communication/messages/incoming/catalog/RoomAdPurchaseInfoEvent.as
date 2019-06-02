//com.sulake.habbo.communication.messages.incoming.catalog.RoomAdPurchaseInfoEvent

package com.sulake.habbo.communication.messages.incoming.catalog{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.catalog.RoomAdPurchaseInfoEventParser;

    [SecureSWF(rename="true")]
    public class RoomAdPurchaseInfoEvent extends MessageEvent implements IMessageEvent {

        public function RoomAdPurchaseInfoEvent(k:Function);

        public function getParser():RoomAdPurchaseInfoEventParser;


    }
}//package com.sulake.habbo.communication.messages.incoming.catalog

