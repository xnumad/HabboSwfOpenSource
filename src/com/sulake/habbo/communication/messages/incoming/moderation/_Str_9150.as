package com.sulake.habbo.communication.messages.incoming.moderation
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.moderation.ModeratorToolPreferencesMessageParser;

    public class _Str_9150 extends MessageEvent implements IMessageEvent 
    {
        public function _Str_9150(k:Function)
        {
            super(k, ModeratorToolPreferencesMessageParser);
        }

        public function getParser():ModeratorToolPreferencesMessageParser
        {
            return parser as ModeratorToolPreferencesMessageParser;
        }
    }
}
