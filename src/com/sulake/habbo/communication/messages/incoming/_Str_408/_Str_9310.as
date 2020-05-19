package com.sulake.habbo.communication.messages.incoming._Str_408
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.mysterybox.MysteryBoxKeysMessageParser;

    public class _Str_9310 extends MessageEvent implements IMessageEvent 
    {
        public function _Str_9310(k:Function)
        {
            super(k, MysteryBoxKeysMessageParser);
        }

        public function getParser():MysteryBoxKeysMessageParser
        {
            return _parser as MysteryBoxKeysMessageParser;
        }
    }
}
