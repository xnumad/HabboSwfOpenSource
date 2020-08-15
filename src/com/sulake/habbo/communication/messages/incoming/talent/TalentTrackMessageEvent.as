package com.sulake.habbo.communication.messages.incoming.talent
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.talent.TalentTrackMessageParser;

    public class TalentTrackMessageEvent extends MessageEvent implements IMessageEvent
    {
        public function TalentTrackMessageEvent(k:Function)
        {
            super(k, TalentTrackMessageParser);
        }

        public function getParser():TalentTrackMessageParser
        {
            return _parser as TalentTrackMessageParser;
        }
    }
}
