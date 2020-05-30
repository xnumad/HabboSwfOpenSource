package com.sulake.habbo.communication.messages.incoming.friendfurni
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.friendfurni._Str_9542;

    public class FriendFurniOtherLockConfirmedMessageEvent extends MessageEvent implements IMessageEvent
    {
        public function FriendFurniOtherLockConfirmedMessageEvent(k:Function)
        {
            super(k, _Str_9542);
        }

        public function getParser():_Str_9542
        {
            return _parser as _Str_9542;
        }
    }
}
