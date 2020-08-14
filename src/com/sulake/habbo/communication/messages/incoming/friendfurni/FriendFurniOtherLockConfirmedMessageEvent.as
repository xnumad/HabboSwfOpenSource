package com.sulake.habbo.communication.messages.incoming.friendfurni
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.friendfurni.FriendFurniOtherLockConfirmedMessageParser;

    public class FriendFurniOtherLockConfirmedMessageEvent extends MessageEvent implements IMessageEvent
    {
        public function FriendFurniOtherLockConfirmedMessageEvent(k:Function)
        {
            super(k, FriendFurniOtherLockConfirmedMessageParser);
        }

        public function getParser():FriendFurniOtherLockConfirmedMessageParser
        {
            return _parser as FriendFurniOtherLockConfirmedMessageParser;
        }
    }
}
