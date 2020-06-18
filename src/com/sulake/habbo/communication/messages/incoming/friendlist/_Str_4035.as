package com.sulake.habbo.communication.messages.incoming.friendlist
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.friendlist.FriendListUpdateMessageParser;

    public class _Str_4035 extends MessageEvent implements IMessageEvent 
    {
        public function _Str_4035(k:Function)
        {
            super(k, FriendListUpdateMessageParser);
        }

        public function getParser():FriendListUpdateMessageParser
        {
            return this._parser as FriendListUpdateMessageParser;
        }
    }
}
