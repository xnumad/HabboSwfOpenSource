package com.sulake.habbo.communication.messages.outgoing.room.engine
{
    import com.sulake.core.communication.messages.IMessageComposer;

    public class PetMessageComposer implements IMessageComposer
    {
        protected var _array:Array;

        public function PetMessageComposer(k:int)
        {
            this._array = [];
            super();
            this._array.push(k);
        }

        public function getMessageArray():Array
        {
            return this._array;
        }

        public function dispose():void
        {
            this._array = null;
        }
    }
}
