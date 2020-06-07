package com.sulake.habbo.communication.messages.incoming.catalog
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.catalog.RoomAdPurchaseInfoEventParser;

    public class RoomAdPurchaseInfoEvent extends MessageEvent implements IMessageEvent
    {
        public function RoomAdPurchaseInfoEvent(k:Function)
        {
            super(k, RoomAdPurchaseInfoEventParser);
        }

        public function getParser():RoomAdPurchaseInfoEventParser
        {
            return this._parser as RoomAdPurchaseInfoEventParser;
        }
    }
}
