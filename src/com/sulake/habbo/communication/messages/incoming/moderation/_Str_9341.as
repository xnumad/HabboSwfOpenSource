package com.sulake.habbo.communication.messages.incoming.moderation
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.moderation.ModeratorActionResultMessageParser;

    public class _Str_9341 extends MessageEvent implements IMessageEvent 
    {
        public function _Str_9341(k:Function)
        {
            super(k, ModeratorActionResultMessageParser);
        }

        public function getParser():ModeratorActionResultMessageParser
        {
            return _parser as ModeratorActionResultMessageParser;
        }
    }
}
