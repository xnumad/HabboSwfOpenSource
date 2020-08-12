package com.sulake.habbo.communication.messages.outgoing.users
{
    import com.sulake.core.communication.messages.IMessageComposer;

    public class GetExtendedProfileByNameMessageComposer implements IMessageComposer
    {
        private var _array:Array;

        public function GetExtendedProfileByNameMessageComposer(k:String)
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
