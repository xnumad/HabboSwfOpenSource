package com.sulake.habbo.communication.messages.incoming.friendlist
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.friendlist.FriendRequestsMessageParser;

    public class _Str_5641 extends MessageEvent implements IMessageEvent 
    {
        public function _Str_5641(k:Function)
        {
            super(k, FriendRequestsMessageParser);
        }

        public function getParser():FriendRequestsMessageParser
        {
            return this._parser as FriendRequestsMessageParser;
        }
    }
}
