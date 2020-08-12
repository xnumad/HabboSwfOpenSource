package com.sulake.habbo.communication.messages.incoming.moderation
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.moderation.ModeratorMessageParser;

    public class _Str_8312 extends MessageEvent implements IMessageEvent 
    {
        public function _Str_8312(k:Function)
        {
            super(k, ModeratorMessageParser);
        }

        public function getParser():ModeratorMessageParser
        {
            return _parser as ModeratorMessageParser;
        }
    }
}
