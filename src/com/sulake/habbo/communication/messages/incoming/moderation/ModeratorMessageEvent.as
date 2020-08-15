package com.sulake.habbo.communication.messages.incoming.moderation
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.moderation.ModeratorMessageParser;

    public class ModeratorMessageEvent extends MessageEvent implements IMessageEvent
    {
        public function ModeratorMessageEvent(k:Function)
        {
            super(k, ModeratorMessageParser);
        }

        public function getParser():ModeratorMessageParser
        {
            return _parser as ModeratorMessageParser;
        }
    }
}
