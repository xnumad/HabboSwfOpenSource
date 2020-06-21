package com.sulake.habbo.communication.messages.outgoing.inventory.furni
{
    import com.sulake.core.communication.messages.IMessageComposer;

    public class RequestRoomPropertySet implements IMessageComposer
    {
        private var _Str_6913:int = 0;

        public function RequestRoomPropertySet(k:int)
        {
            this._Str_6913 = k;
        }

        public function dispose():void
        {
        }

        public function getMessageArray():Array
        {
            var k:Array = new Array();
            k.push(this._Str_6913);
            return k;
        }
    }
}
