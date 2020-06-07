package com.sulake.habbo.communication.messages.incoming.catalog
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.catalog.ClubGiftInfoParser;

    public class _Str_5425 extends MessageEvent implements IMessageEvent 
    {
        public function _Str_5425(k:Function)
        {
            super(k, ClubGiftInfoParser);
        }

        public function getParser():ClubGiftInfoParser
        {
            return this._parser as ClubGiftInfoParser;
        }
    }
}
