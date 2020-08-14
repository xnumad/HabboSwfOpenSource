package com.sulake.habbo.communication.messages.incoming.friendlist
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.friendlist.NewFriendRequestMessageParser;

    public class _Str_4841 extends MessageEvent implements IMessageEvent 
    {
        public function _Str_4841(k:Function)
        {
            super(k, NewFriendRequestMessageParser);
        }

        public function getParser():NewFriendRequestMessageParser
        {
            return this._parser as NewFriendRequestMessageParser;
        }
    }
}
