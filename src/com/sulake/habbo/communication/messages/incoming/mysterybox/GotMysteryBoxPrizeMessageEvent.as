package com.sulake.habbo.communication.messages.incoming.mysterybox
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.mysterybox.GotMysteryBoxPrizeMessageParser;

    public class GotMysteryBoxPrizeMessageEvent extends MessageEvent implements IMessageEvent 
    {
        public function GotMysteryBoxPrizeMessageEvent(k:Function)
        {
            super(k, GotMysteryBoxPrizeMessageParser);
        }

        public function getParser():GotMysteryBoxPrizeMessageParser
        {
            return _parser as GotMysteryBoxPrizeMessageParser;
        }
    }
}
