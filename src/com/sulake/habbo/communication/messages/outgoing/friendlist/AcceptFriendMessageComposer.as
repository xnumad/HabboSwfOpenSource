package com.sulake.habbo.communication.messages.outgoing.friendlist
{
    import com.sulake.core.communication.messages.IMessageComposer;
    import com.sulake.core.runtime.IDisposable;

    public class AcceptFriendMessageComposer implements IMessageComposer, IDisposable 
    {
        private var _acceptedRequestIds:Array;

        public function AcceptFriendMessageComposer()
        {
            this._acceptedRequestIds = new Array();
            super();
        }

        public function getMessageArray():Array
        {
            var k:Array = new Array();
            k.push(this._acceptedRequestIds.length);
            var _local_2:int;
            while (_local_2 < this._acceptedRequestIds.length)
            {
                k.push(this._acceptedRequestIds[_local_2]);
                _local_2++;
            }
            return k;
        }

        public function addAcceptedRequest(k:int):void
        {
            this._acceptedRequestIds.push(k);
        }

        public function dispose():void
        {
            this._acceptedRequestIds = null;
        }

        public function get disposed():Boolean
        {
            return false;
        }
    }
}
