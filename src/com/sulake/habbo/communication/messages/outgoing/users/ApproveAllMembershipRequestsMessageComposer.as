package com.sulake.habbo.communication.messages.outgoing.users
{
    import com.sulake.core.communication.messages.IMessageComposer;

    public class ApproveAllMembershipRequestsMessageComposer implements IMessageComposer
    {
        private var _array:Array;

        public function ApproveAllMembershipRequestsMessageComposer(k:int)
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
