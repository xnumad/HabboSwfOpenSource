package com.sulake.habbo.communication.messages.incoming.competition
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.competition.IsUserPartOfCompetitionMessageParser;

    public class _Str_8237 extends MessageEvent implements IMessageEvent 
    {
        public function _Str_8237(k:Function)
        {
            super(k, IsUserPartOfCompetitionMessageParser);
        }

        public function getParser():IsUserPartOfCompetitionMessageParser
        {
            return _parser as IsUserPartOfCompetitionMessageParser;
        }
    }
}
