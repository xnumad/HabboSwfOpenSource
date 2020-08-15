package com.sulake.habbo.communication.messages.incoming.groupforums
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.groupforums.PostThreadMessageParser;

    public class PostThreadMessageEvent extends MessageEvent implements IMessageEvent
    {
        public function PostThreadMessageEvent(k:Function)
        {
            super(k, PostThreadMessageParser);
        }

        public function getParser():PostThreadMessageParser
        {
            return this._parser as PostThreadMessageParser;
        }
    }
}
