//com.sulake.habbo.tablet.navigator.NavigatorData

package com.sulake.habbo.tablet.navigator{
    import com.sulake.habbo.communication.messages.incoming.navigator.GuestRoomSearchResultData;
    import com.sulake.habbo.communication.messages.incoming.navigator.OfficialRoomsData;
    import com.sulake.habbo.communication.messages.incoming.navigator.OfficialRoomEntryData;
    import com.sulake.habbo.communication.messages.incoming.navigator.PromotedRoomsData;
    import com.sulake.habbo.tablet.navigator.settings.FriendList;
    import com.sulake.habbo.communication.messages.parser.navigator.FavouritesMessageParser;

    public class NavigatorData {

        private var _navigator:HabboTabletNavigator;
        private var _guestRoomSearchResultData:GuestRoomSearchResultData;
        private var _officialRoomsData:OfficialRoomsData;
        private var _adRoom:OfficialRoomEntryData;
        private var _promotedRooms:PromotedRoomsData;
        private var _categories:Array;
        private var _visibleCategories:Array;
        private var _favouriteLimit:int;
        private var _favouriteIds:Array;
        private var _homeRoomId:int;
        private var _friendList:FriendList;

        public function NavigatorData(k:HabboTabletNavigator);

        public function dispose():void;

        public function get friendList():FriendList;

        public function set guestRoomSearchResultData(k:GuestRoomSearchResultData):void;

        public function set officialRoomsData(k:OfficialRoomsData):void;

        public function set adRoom(k:OfficialRoomEntryData):void;

        public function set promotedRooms(k:PromotedRoomsData):void;

        public function get officialRoomsData():OfficialRoomsData;

        public function get guestRoomSearchResultData():GuestRoomSearchResultData;

        public function get categories():Array;

        public function get visibleCategories():Array;

        public function set categories(k:Array):void;

        public function onFavourites(k:FavouritesMessageParser):void;

        public function favouriteChanged(k:int, _arg_2:Boolean):void;

        public function isRoomFavourite(k:int):Boolean;

        public function isFavouritesFull():Boolean;

        public function get homeRoomId():int;

        public function set homeRoomId(k:int):void;


    }
}//package com.sulake.habbo.tablet.navigator

