package com.sulake.habbo.navigator.mainview
{
    import com.sulake.habbo.communication.messages.incoming.navigator._Str_3451;
    import com.sulake.habbo.navigator.HabboNavigator;
    import com.sulake.habbo.navigator.domain.RoomSessionTags;

    public class PromotedRoomsGuestRoomListCtrl extends GuestRoomListCtrl 
    {
        private var _category:_Str_3451;

        public function PromotedRoomsGuestRoomListCtrl(k:HabboNavigator)
        {
            super(k, -6, false);
        }

        public function set category(k:_Str_3451):void
        {
            this._category = k;
        }

        override public function getRooms():Array
        {
            return this._category.rooms;
        }

        override public function beforeEnterRoom(k:int):void
        {
            navigator.data.roomSessionTags = new RoomSessionTags(this._category.code, ("" + (k + 2)));
        }
    }
}
