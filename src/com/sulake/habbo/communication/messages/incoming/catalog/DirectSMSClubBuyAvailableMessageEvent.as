package com.sulake.habbo.communication.messages.incoming.catalog
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.catalog.DirectSMSClubBuyAvailableMessageParser;

    public class DirectSMSClubBuyAvailableMessageEvent extends MessageEvent implements IMessageEvent
    {
        public function DirectSMSClubBuyAvailableMessageEvent(k:Function)
        {
            super(k, DirectSMSClubBuyAvailableMessageParser);
        }

        public function getParser():DirectSMSClubBuyAvailableMessageParser
        {
            return this._parser as DirectSMSClubBuyAvailableMessageParser;
        }
    }
}
