package com.sulake.habbo.communication.messages.outgoing.inventory.furni
{
    import com.sulake.core.communication.messages.IMessageComposer;

    public class RequestFurniInventoryWhenNotInRoomComposer implements IMessageComposer
    {
        public function dispose():void
        {
        }

        public function getMessageArray():Array
        {
            return new Array();
        }
    }
}
