package com.sulake.habbo.communication.messages.incoming.moderation
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.moderation.ModerationCautionParser;

    public class ModeratorCautionEvent extends MessageEvent implements IMessageEvent
    {
        public function ModeratorCautionEvent(k:Function)
        {
            super(k, ModerationCautionParser);
        }

        public function getParser():ModerationCautionParser
        {
            return _parser as ModerationCautionParser;
        }
    }
}
