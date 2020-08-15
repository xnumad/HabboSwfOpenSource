package com.sulake.habbo.communication.messages.incoming.room.furniture
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.room.furniture.RequestSpamWallPostItMessageParser;

    public class RequestSpamWallPostItMessageEvent extends MessageEvent implements IMessageEvent
    {
        public function RequestSpamWallPostItMessageEvent(k:Function)
        {
            super(k, RequestSpamWallPostItMessageParser);
        }

        public function getParser():RequestSpamWallPostItMessageParser
        {
            return _parser as RequestSpamWallPostItMessageParser;
        }
    }
}
