package com.sulake.habbo.communication.messages.incoming.groupforums
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.groupforums.GuildForumThreadsParser;

    public class GuildForumThreadsEvent extends MessageEvent implements IMessageEvent 
    {
        public function GuildForumThreadsEvent(k:Function)
        {
            super(k, GuildForumThreadsParser);
        }

        public function getParser():GuildForumThreadsParser
        {
            return this._parser as GuildForumThreadsParser;
        }
    }
}
