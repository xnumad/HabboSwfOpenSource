package com.sulake.habbo.communication.messages.incoming.moderation
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.moderation.ModeratorUserInfoMessageParser;

    public class _Str_9413 extends MessageEvent implements IMessageEvent 
    {
        public function _Str_9413(k:Function)
        {
            super(k, ModeratorUserInfoMessageParser);
        }

        public function getParser():ModeratorUserInfoMessageParser
        {
            return _parser as ModeratorUserInfoMessageParser;
        }
    }
}
