package com.sulake.habbo.communication.messages.incoming.quest
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.quest.SeasonalQuestsParser;

    public class SeasonalQuestsMessageEvent extends MessageEvent implements IMessageEvent 
    {
        public function SeasonalQuestsMessageEvent(k:Function)
        {
            super(k, SeasonalQuestsParser);
        }

        public function getParser():SeasonalQuestsParser
        {
            return _parser as SeasonalQuestsParser;
        }
    }
}
