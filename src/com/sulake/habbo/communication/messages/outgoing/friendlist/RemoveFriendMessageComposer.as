package com.sulake.habbo.communication.messages.outgoing.friendlist
{
    import com.sulake.core.communication.messages.IMessageComposer;
    import com.sulake.core.runtime.IDisposable;

    public class RemoveFriendMessageComposer implements IMessageComposer, IDisposable 
    {
        private var _removedAvatarIds:Array;

        public function RemoveFriendMessageComposer()
        {
            this._removedAvatarIds = new Array();
            super();
        }

        public function getMessageArray():Array
        {
            var k:Array = new Array();
            k.push(this._removedAvatarIds.length);
            var _local_2:int;
            while (_local_2 < this._removedAvatarIds.length)
            {
                k.push(this._removedAvatarIds[_local_2]);
                _local_2++;
            }
            return k;
        }

        public function addRemovedFriend(k:int):void
        {
            this._removedAvatarIds.push(k);
        }

        public function dispose():void
        {
            this._removedAvatarIds = null;
        }

        public function get disposed():Boolean
        {
            return false;
        }
    }
}
