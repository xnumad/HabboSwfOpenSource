package com.sulake.habbo.communication.messages.incoming.friendlist
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.friendlist.RoomInviteErrorMessageParser;

    public class _Str_9229 extends MessageEvent implements IMessageEvent 
    {
        public function _Str_9229(k:Function)
        {
            super(k, RoomInviteErrorMessageParser);
        }

        public function getParser():RoomInviteErrorMessageParser
        {
            return this._parser as RoomInviteErrorMessageParser;
        }
    }
}
