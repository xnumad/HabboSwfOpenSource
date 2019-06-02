//com.sulake.habbo.friends.FriendList

package com.sulake.habbo.friends{
    import com.sulake.habbo.avatar.IAvatarRenderManager;
    import com.sulake.habbo.session.ISessionDataManager;
    import com.sulake.habbo.ui.HabboUI;
    import com.sulake.habbo.profile.avatar.slot.AvatarImageSlot;
    import com.sulake.habbo.profile.avatar.slot.AvatarDetailsSlot;
    import feathers.controls.LayoutGroup;
    import feathers.controls.Button;
    import flash.utils.Dictionary;
    import __AS3__.vec.Vector;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.IHabboCommunicationManager;
    import starling.display.DisplayObject;
    import starling.events.Event;
    import com.sulake.habbo.communication.messages.incoming.users.ExtendedProfileMessageEvent;
    import com.sulake.core.communication.messages.IMessageComposer;

    public class FriendList {

        private var _avatarRenderManager:IAvatarRenderManager;
        private var _sessionDataManager:ISessionDataManager;
        private var _habboUI:HabboUI;
        private var _avatarSlot:AvatarImageSlot;
        private var _friendsSlot:FriendsSlot;
        private var _detailsSlot:AvatarDetailsSlot;
        private var _detailsGroup:LayoutGroup;
        private var _followButton:Button;
        private var _removeButton:Button;
        private var _declineRequestButton:Button;
        private var _acceptRequestButton:Button;
        private var _closeButton:Button;
        private var _mainContainer:LayoutGroup;
        private var _userDataContainer:LayoutGroup;
        private var _currentUserId:int;
        private var _friends:Dictionary;
        private var _disposed:Boolean;
        private var _msgEvents:Vector.<IMessageEvent>;
        private var _communication:IHabboCommunicationManager;
        private var _friendButtonGroup:LayoutGroup;
        private var _requestButtonGroup:LayoutGroup;

        public function FriendList(k:HabboUI, _arg_2:IHabboCommunicationManager, _arg_3:IAvatarRenderManager, _arg_4:ISessionDataManager);

        private static function createButton(k:LayoutGroup, _arg_2:String, _arg_3:Function, _arg_4:String=null):Button;


        public function dispose():void;

        public function get view():DisplayObject;

        public function get friends():Dictionary;

        public function getFriend(k:int):Friend;

        private function hide():void;

        public function get habboUI():HabboUI;

        public function setup():void;

        public function searchReceived(k:Array, _arg_2:Array):void;

        private function createView():void;

        private function onCloseButton(k:Event):void;

        private function onRemoveFriendButton(k:Event):void;

        private function onMessageButton(k:Event):void;

        private function onFollowButton(k:Event):void;

        private function onDeclineFriendRequest(k:Event):void;

        private function onAcceptFriendRequest(k:Event):void;

        public function requestAccountDetails(k:int):void;

        private function addMessages():void;

        private function addMessage(k:IMessageEvent):void;

        private function removeMessages():void;

        private function onProfile(k:ExtendedProfileMessageEvent):void;

        private function addToDetailsGroup(k:LayoutGroup):void;

        private function removeFromDetailsGroup(k:LayoutGroup):void;

        private function removeFriend(k:int):void;

        private function addFriend(k:Friend):void;

        private function updateFriends():void;

        public function isFriendOnline(k:int):Boolean;

        public function isFollowingAllowed(k:int):Boolean;

        private function onMessengerInit(k:IMessageEvent):void;

        public function onFriendListUpdate(k:IMessageEvent):void;

        private function onFriendRequests(k:IMessageEvent):void;

        public function send(k:IMessageComposer):void;


    }
}//package com.sulake.habbo.friends

