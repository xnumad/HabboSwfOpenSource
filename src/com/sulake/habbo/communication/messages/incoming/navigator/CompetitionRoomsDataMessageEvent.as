package com.sulake.habbo.communication.messages.incoming.navigator
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.navigator.CompetitionRoomsDataMessageParser;

    public class CompetitionRoomsDataMessageEvent extends MessageEvent implements IMessageEvent
    {
        public function CompetitionRoomsDataMessageEvent(k:Function)
        {
            super(k, CompetitionRoomsDataMessageParser);
        }

        public function getParser():CompetitionRoomsDataMessageParser
        {
            return this._parser as CompetitionRoomsDataMessageParser;
        }
    }
}
