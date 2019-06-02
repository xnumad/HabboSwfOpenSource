//com.sulake.habbo.communication.messages.outgoing.friendlist.SendRoomInviteMessageComposer

package com.sulake.habbo.communication.messages.outgoing.friendlist{
    import com.sulake.core.communication.messages.IMessageComposer;
    import com.sulake.core.runtime.IDisposable;

    [SecureSWF(rename="true")]
    public class SendRoomInviteMessageComposer implements IMessageComposer, IDisposable {

        private var _invitedAvatarIds:Array;
        private var _msg:String;

        public function SendRoomInviteMessageComposer(k:String);

        public function getMessageArray():Array;

        public function addInvitedFriend(k:int):void;

        public function dispose():void;

        public function get disposed():Boolean;


    }
}//package com.sulake.habbo.communication.messages.outgoing.friendlist

