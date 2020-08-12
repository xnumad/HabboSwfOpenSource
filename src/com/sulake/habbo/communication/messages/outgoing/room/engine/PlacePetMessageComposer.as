package com.sulake.habbo.communication.messages.outgoing.room.engine
{
    import com.sulake.core.communication.messages.IMessageComposer;

    public class PlacePetMessageComposer implements IMessageComposer
    {
        private var _petId:int;
        private var _x:int;
        private var _y:int;

        public function PlacePetMessageComposer(k:int, _arg_2:int, _arg_3:int)
        {
            this._petId = k;
            this._x = _arg_2;
            this._y = _arg_3;
        }

        public function dispose():void
        {
        }

        public function getMessageArray():Array
        {
            return [this._petId, this._x, this._y];
        }
    }
}
