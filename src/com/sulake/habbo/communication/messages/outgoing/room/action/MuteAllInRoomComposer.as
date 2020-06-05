package com.sulake.habbo.communication.messages.outgoing.room.action
{
    import com.sulake.core.communication.messages.IMessageComposer;

    public class MuteAllInRoomComposer implements IMessageComposer
    {


        public function getMessageArray():Array
        {
            return [];
        }

        public function dispose():void
        {
        }
    }
}
