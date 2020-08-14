package com.sulake.habbo.communication.messages.incoming.friendfurni
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.friendfurni.FriendFurniCancelLockMessageParser;

    public class FriendFurniCancelLockMessageEvent extends MessageEvent implements IMessageEvent
    {
        public function FriendFurniCancelLockMessageEvent(k:Function)
        {
            super(k, FriendFurniCancelLockMessageParser);
        }

        public function getParser():FriendFurniCancelLockMessageParser
        {
            return _parser as FriendFurniCancelLockMessageParser;
        }
    }
}
