package com.sulake.habbo.communication.messages.incoming.friendlist
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.friendlist.AcceptFriendResultMessageParser;

    public class _Str_7759 extends MessageEvent implements IMessageEvent 
    {
        public function _Str_7759(k:Function)
        {
            super(k, AcceptFriendResultMessageParser);
        }

        public function getParser():AcceptFriendResultMessageParser
        {
            return this._parser as AcceptFriendResultMessageParser;
        }
    }
}
