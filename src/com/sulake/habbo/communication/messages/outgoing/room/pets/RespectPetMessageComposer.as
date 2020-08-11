package com.sulake.habbo.communication.messages.outgoing.room.pets
{
    import com.sulake.core.communication.messages.IMessageComposer;
    import com.sulake.core.runtime.IDisposable;

    public class RespectPetMessageComposer implements IMessageComposer, IDisposable
    {
        private var _array:Array;

        public function RespectPetMessageComposer(k:int)
        {
            this._array = new Array();
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

        public function get disposed():Boolean
        {
            return false;
        }
    }
}
