package com.sulake.habbo.communication.messages.incoming.room.permissions
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.habbo.communication.messages.parser.room.permissions.YouAreOwnerMessageParser;

    public class YouAreOwnerMessageEvent extends MessageEvent
    {
        public function YouAreOwnerMessageEvent(k:Function)
        {
            super(k, YouAreOwnerMessageParser);
        }

        public function getParser():YouAreOwnerMessageParser
        {
            return _parser as YouAreOwnerMessageParser;
        }
    }
}
