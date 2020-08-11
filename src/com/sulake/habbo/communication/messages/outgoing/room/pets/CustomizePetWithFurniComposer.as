package com.sulake.habbo.communication.messages.outgoing.room.pets
{
    import com.sulake.core.communication.messages.IMessageComposer;

    public class CustomizePetWithFurniComposer implements IMessageComposer
    {
        private var _data:Array;

        public function CustomizePetWithFurniComposer(k:int, _arg_2:int)
        {
            this._data = [];
            super();
            this._data.push(k);
            this._data.push(_arg_2);
        }

        public function getMessageArray():Array
        {
            return this._data;
        }

        public function dispose():void
        {
            this._data = null;
        }
    }
}
