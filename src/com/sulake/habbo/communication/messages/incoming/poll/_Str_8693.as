package com.sulake.habbo.communication.messages.incoming.poll
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.poll.PollContentsParser;

    public class _Str_8693 extends MessageEvent implements IMessageEvent 
    {
        public function _Str_8693(k:Function)
        {
            super(k, PollContentsParser);
        }

        public function getParser():PollContentsParser
        {
            return _parser as PollContentsParser;
        }
    }
}
