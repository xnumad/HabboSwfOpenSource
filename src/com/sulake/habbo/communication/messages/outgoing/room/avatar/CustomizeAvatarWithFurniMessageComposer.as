package com.sulake.habbo.communication.messages.outgoing.room.avatar
{
    import com.sulake.core.communication.messages.IMessageComposer;

    public class CustomizeAvatarWithFurniMessageComposer implements IMessageComposer
    {
        private var _array:Array;

        public function CustomizeAvatarWithFurniMessageComposer(k:int)
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
