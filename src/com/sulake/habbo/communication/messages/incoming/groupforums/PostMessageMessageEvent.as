package com.sulake.habbo.communication.messages.incoming.groupforums
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.groupforums.PostMessageMessageParser;

    public class PostMessageMessageEvent extends MessageEvent implements IMessageEvent
    {
        public function PostMessageMessageEvent(k:Function)
        {
            super(k, PostMessageMessageParser);
        }

        public function getParser():PostMessageMessageParser
        {
            return this._parser as PostMessageMessageParser;
        }
    }
}
