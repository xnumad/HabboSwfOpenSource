package com.sulake.habbo.communication.messages.outgoing.friendlist
{
    import com.sulake.core.communication.messages.IMessageComposer;
    import com.sulake.core.runtime.IDisposable;

    public class DeclineFriendMessageComposer implements IMessageComposer, IDisposable 
    {
        private var _declinedRequestIds:Array;

        public function DeclineFriendMessageComposer()
        {
            this._declinedRequestIds = new Array();
            super();
        }

        public function getMessageArray():Array
        {
            var _local_2:int;
            var k:Array = new Array();
            if (this._declinedRequestIds.length == 0)
            {
                k.push(true);
                k.push(0);
            }
            else
            {
                k.push(false);
                k.push(this._declinedRequestIds.length);
                _local_2 = 0;
                while (_local_2 < this._declinedRequestIds.length)
                {
                    k.push(this._declinedRequestIds[_local_2]);
                    _local_2++;
                }
            }
            return k;
        }

        public function addDeclinedRequest(k:int):void
        {
            this._declinedRequestIds.push(k);
        }

        public function dispose():void
        {
            this._declinedRequestIds = null;
        }

        public function get disposed():Boolean
        {
            return false;
        }
    }
}
