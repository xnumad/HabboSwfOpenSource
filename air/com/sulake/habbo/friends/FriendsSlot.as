//com.sulake.habbo.friends.FriendsSlot

package com.sulake.habbo.friends{
    import feathers.controls.LayoutGroup;
    import com.sulake.habbo.ui.HabboUI;
    import com.sulake.habbo.session.ISessionDataManager;
    import feathers.controls.GroupedList;
    import starling.textures.Texture;
    import starling.events.Event;
    import flash.utils.Dictionary;

    public class FriendsSlot extends LayoutGroup {

        private var _friendList:FriendList;
        private var _habboUI:HabboUI;
        private var _sessionDataManager:ISessionDataManager;
        private var _search:FriendListSearch;
        private var _requests:Array;
        private var _onlineFriends:Array;
        private var _offlineFriends:Array;
        private var _list:GroupedList;
        private var _maleTex:Texture;
        private var _femaleTex:Texture;

        public function FriendsSlot(k:FriendList, _arg_2:HabboUI, _arg_3:ISessionDataManager);

        private static function sortOnName(k:Friend, _arg_2:Friend):Number;


        override public function dispose():void;

        public function onSearchResults(k:Array, _arg_2:Array):void;

        private function createView():void;

        private function onListChange(k:Event):void;

        public function selectFriend(k:Friend):void;

        public function populateFriends(k:Dictionary):void;

        public function populateRequestList(k:Array):void;

        private function updateRequestNotifications():void;

        public function removeRequest(k:FriendRequest):void;

        public function getRequest(k:int):FriendRequest;

        private function populateAll():void;


    }
}//package com.sulake.habbo.friends

