package com.sulake.habbo.communication.messages.outgoing.users
{
    import com.sulake.core.communication.messages.IMessageComposer;

    public class KickMemberMessageComposer implements IMessageComposer
    {
        private var _array:Array;

        public function KickMemberMessageComposer(k:int, _arg_2:int, _arg_3:Boolean=false)
        {
            this._array = [];
            super();
            this._array.push(k);
            this._array.push(_arg_2);
            this._array.push(_arg_3);
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
