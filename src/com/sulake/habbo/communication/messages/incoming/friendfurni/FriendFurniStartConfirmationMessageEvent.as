package com.sulake.habbo.communication.messages.incoming.friendfurni
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.friendfurni.FriendFurniStartConfirmationMessageParser;

    public class FriendFurniStartConfirmationMessageEvent extends MessageEvent implements IMessageEvent 
    {
        public function FriendFurniStartConfirmationMessageEvent(k:Function)
        {
            super(k, FriendFurniStartConfirmationMessageParser);
        }

        public function getParser():FriendFurniStartConfirmationMessageParser
        {
            return _parser as FriendFurniStartConfirmationMessageParser;
        }
    }
}
