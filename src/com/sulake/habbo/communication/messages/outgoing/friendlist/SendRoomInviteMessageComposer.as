package com.sulake.habbo.communication.messages.outgoing.friendlist
{
    import com.sulake.core.communication.messages.IMessageComposer;
    import com.sulake.core.runtime.IDisposable;

    public class SendRoomInviteMessageComposer implements IMessageComposer, IDisposable 
    {
        private var _invitedAvatarIds:Array;
        private var _msg:String;

        public function SendRoomInviteMessageComposer(k:String)
        {
            this._invitedAvatarIds = new Array();
            super();
            this._msg = k;
        }

        public function getMessageArray():Array
        {
            var k:Array = new Array();
            k.push(this._invitedAvatarIds.length);
            var _local_2:int;
            while (_local_2 < this._invitedAvatarIds.length)
            {
                k.push(this._invitedAvatarIds[_local_2]);
                _local_2++;
            }
            k.push(this._msg);
            return k;
        }

        public function addInvitedFriend(k:int):void
        {
            this._invitedAvatarIds.push(k);
        }

        public function dispose():void
        {
            this._invitedAvatarIds = null;
        }

        public function get disposed():Boolean
        {
            return false;
        }
    }
}
