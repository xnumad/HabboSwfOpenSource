package com.sulake.habbo.communication.messages.incoming.catalog
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.catalog.DirectSMSClubBuyAvailableMessageParser;

    public class _Str_17034 extends MessageEvent implements IMessageEvent 
    {
        public function _Str_17034(k:Function)
        {
            super(k, DirectSMSClubBuyAvailableMessageParser);
        }

        public function getParser():DirectSMSClubBuyAvailableMessageParser
        {
            return this._parser as DirectSMSClubBuyAvailableMessageParser;
        }
    }
}
