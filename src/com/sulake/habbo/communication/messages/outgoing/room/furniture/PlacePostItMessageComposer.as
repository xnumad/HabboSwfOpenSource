package com.sulake.habbo.communication.messages.outgoing.room.furniture
{
    import com.sulake.core.communication.messages.IMessageComposer;

    public class PlacePostItMessageComposer implements IMessageComposer
    {
        private var _itemId:int;
        private var _location:String;

        public function PlacePostItMessageComposer(k:int, _arg_2:String)
        {
            this._itemId = k;
            this._location = _arg_2;
        }

        public function dispose():void
        {
        }

        public function getMessageArray():Array
        {
            return [this._itemId, this._location];
        }
    }
}
