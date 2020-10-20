package com.sulake.habbo.communication.messages.outgoing.room.chat
{
    import com.sulake.core.communication.messages.IMessageComposer;

    public class StartTypingMessageComposer implements IMessageComposer
    {
        public function dispose():void
        {
        }

        public function getMessageArray():Array
        {
            return [];
        }
    }
}
