package com.sulake.habbo.communication.messages.incoming.mysterybox
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.mysterybox.MysteryBoxKeysMessageParser;

    public class MysteryBoxKeysMessageEvent extends MessageEvent implements IMessageEvent 
    {
        public function MysteryBoxKeysMessageEvent(k:Function)
        {
            super(k, MysteryBoxKeysMessageParser);
        }

        public function getParser():MysteryBoxKeysMessageParser
        {
            return _parser as MysteryBoxKeysMessageParser;
        }
    }
}
