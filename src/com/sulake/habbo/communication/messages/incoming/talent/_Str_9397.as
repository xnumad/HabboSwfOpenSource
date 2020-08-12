package com.sulake.habbo.communication.messages.incoming.talent
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.talent.TalentTrackLevelMessageParser;

    public class _Str_9397 extends MessageEvent implements IMessageEvent 
    {
        public function _Str_9397(k:Function)
        {
            super(k, TalentTrackLevelMessageParser);
        }

        public function getParser():TalentTrackLevelMessageParser
        {
            return _parser as TalentTrackLevelMessageParser;
        }
    }
}
