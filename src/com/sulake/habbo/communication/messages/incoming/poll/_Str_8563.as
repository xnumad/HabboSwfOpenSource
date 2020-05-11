package com.sulake.habbo.communication.messages.incoming.poll
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.poll.PollErrorParser;

    public class _Str_8563 extends MessageEvent implements IMessageEvent 
    {
        public function _Str_8563(k:Function)
        {
            super(k, PollErrorParser);
        }

        public function getParser():PollErrorParser
        {
            return _parser as PollErrorParser;
        }
    }
}
