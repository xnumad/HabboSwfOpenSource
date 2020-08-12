package com.sulake.habbo.communication.messages.incoming.talent
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.talent.TalentTrackMessageParser;

    public class _Str_7229 extends MessageEvent implements IMessageEvent 
    {
        public function _Str_7229(k:Function)
        {
            super(k, TalentTrackMessageParser);
        }

        public function getParser():TalentTrackMessageParser
        {
            return _parser as TalentTrackMessageParser;
        }
    }
}
