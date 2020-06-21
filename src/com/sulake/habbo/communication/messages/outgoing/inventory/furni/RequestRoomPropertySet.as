package com.sulake.habbo.communication.messages.outgoing.inventory.furni
{
    import com.sulake.core.communication.messages.IMessageComposer;

    public class RequestRoomPropertySet implements IMessageComposer
    {
        private var _stripId:int = 0;

        public function RequestRoomPropertySet(k:int)
        {
            this._stripId = k;
        }

        public function dispose():void
        {
        }

        public function getMessageArray():Array
        {
            var k:Array = new Array();
            k.push(this._stripId);
            return k;
        }
    }
}
