package com.sulake.habbo.communication.messages.incoming.catalog
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.catalog.HabboClubOffersMessageParser;

    public class _Str_7706 extends MessageEvent implements IMessageEvent 
    {
        public function _Str_7706(k:Function)
        {
            super(k, HabboClubOffersMessageParser);
        }

        public function getParser():HabboClubOffersMessageParser
        {
            return this._parser as HabboClubOffersMessageParser;
        }
    }
}
