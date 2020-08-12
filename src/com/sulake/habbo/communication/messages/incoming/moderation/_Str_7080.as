package com.sulake.habbo.communication.messages.incoming.moderation
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.moderation.ModeratorInitMessageParser;

    public class _Str_7080 extends MessageEvent implements IMessageEvent 
    {
        public function _Str_7080(k:Function)
        {
            super(k, ModeratorInitMessageParser);
        }

        public function getParser():ModeratorInitMessageParser
        {
            return _parser as ModeratorInitMessageParser;
        }
    }
}
