package com.sulake.habbo.communication.messages.incoming.friendfurni
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.friendfurni._Str_8861;

    public class FriendFurniCancelLockMessageEvent extends MessageEvent implements IMessageEvent
    {
        public function FriendFurniCancelLockMessageEvent(k:Function)
        {
            super(k, _Str_8861);
        }

        public function getParser():_Str_8861
        {
            return _parser as _Str_8861;
        }
    }
}
