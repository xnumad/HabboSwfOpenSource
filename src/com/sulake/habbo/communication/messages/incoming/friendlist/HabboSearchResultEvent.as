package com.sulake.habbo.communication.messages.incoming.friendlist
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.friendlist.HabboSearchResultMessageParser;

    public class HabboSearchResultEvent extends MessageEvent implements IMessageEvent
    {
        public function HabboSearchResultEvent(k:Function)
        {
            super(k, HabboSearchResultMessageParser);
        }

        public function getParser():HabboSearchResultMessageParser
        {
            return this._parser as HabboSearchResultMessageParser;
        }
    }
}
