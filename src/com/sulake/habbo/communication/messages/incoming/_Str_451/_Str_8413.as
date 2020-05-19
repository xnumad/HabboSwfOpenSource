package com.sulake.habbo.communication.messages.incoming._Str_451
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.friendfurni.FriendFurniStartConfirmationMessageParser;

    public class _Str_8413 extends MessageEvent implements IMessageEvent 
    {
        public function _Str_8413(k:Function)
        {
            super(k, FriendFurniStartConfirmationMessageParser);
        }

        public function getParser():FriendFurniStartConfirmationMessageParser
        {
            return _parser as FriendFurniStartConfirmationMessageParser;
        }
    }
}
