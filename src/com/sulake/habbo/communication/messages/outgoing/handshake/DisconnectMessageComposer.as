package com.sulake.habbo.communication.messages.outgoing.handshake
{
    import com.sulake.core.communication.messages.IMessageComposer;

    public class DisconnectMessageComposer implements IMessageComposer
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
