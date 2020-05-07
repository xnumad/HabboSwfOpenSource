package com.sulake.habbo.communication.messages.incoming.poll
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.poll.PollStartParser;

    public class _Str_8499 extends MessageEvent implements IMessageEvent 
    {
        public function _Str_8499(k:Function)
        {
            super(k, PollStartParser);
        }

        public function getParser():PollStartParser
        {
            return _parser as PollStartParser;
        }
    }
}
