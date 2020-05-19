package com.sulake.habbo.communication.messages.incoming._Str_408
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.mysterybox.GotMysteryBoxPrizeMessageParser;

    public class _Str_7599 extends MessageEvent implements IMessageEvent 
    {
        public function _Str_7599(k:Function)
        {
            super(k, GotMysteryBoxPrizeMessageParser);
        }

        public function getParser():GotMysteryBoxPrizeMessageParser
        {
            return _parser as GotMysteryBoxPrizeMessageParser;
        }
    }
}
