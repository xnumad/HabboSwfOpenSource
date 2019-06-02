//com.sulake.habbo.friends.FriendListSearch

package com.sulake.habbo.friends{
    import feathers.controls.TextInput;
    import feathers.core.FeathersControl;
    import starling.events.Event;
    import feathers.controls.Callout;

    public class FriendListSearch {

        private var _friendList:FriendList;
        private var _friendsSlot:FriendsSlot;
        private var _searchField:TextInput;

        public function FriendListSearch(k:FriendList, _arg_2:FriendsSlot);

        public function dispose():void;

        public function get view():FeathersControl;

        private function createView():void;

        private function onSearchFieldEnter(k:Event):void;

        public function onSearchResults(k:Array, _arg_2:Array):void;

        private function calloutFactory():Callout;

        private function onSearchSelected(k:Event):void;


    }
}//package com.sulake.habbo.friends

