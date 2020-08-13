package com.sulake.habbo.communication.messages.outgoing.competition
{
    import com.sulake.core.communication.messages.IMessageComposer;

    public class ForwardToASubmittableRoomMessageComposer implements IMessageComposer
    {


        public function getMessageArray():Array
        {
            return [];
        }

        public function dispose():void
        {
        }

        public function get disposed():Boolean
        {
            return false;
        }
    }
}
