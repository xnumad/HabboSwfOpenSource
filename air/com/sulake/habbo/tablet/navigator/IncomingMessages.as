//com.sulake.habbo.tablet.navigator.IncomingMessages

package com.sulake.habbo.tablet.navigator{
    import __AS3__.vec.Vector;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.incoming.handshake.AuthenticationOKMessageEvent;
    import com.sulake.habbo.communication.messages.incoming.navigator.UserFlatCatsEvent;
    import com.sulake.habbo.communication.messages.incoming.navigator.GuestRoomSearchResultEvent;
    import com.sulake.habbo.communication.messages.incoming.navigator.OfficialRoomsEvent;
    import com.sulake.habbo.communication.messages.incoming.handshake.GenericErrorEvent;
    import com.sulake.habbo.communication.messages.incoming.room.session.CloseConnectionMessageEvent;
    import com.sulake.habbo.communication.messages.incoming.navigator.DoorbellMessageEvent;
    import com.sulake.habbo.communication.messages.incoming.room.session.FlatAccessibleMessageEvent;
    import com.sulake.habbo.communication.messages.incoming.navigator.FlatAccessDeniedMessageEvent;
    import com.sulake.habbo.communication.messages.incoming.room.session.CantConnectMessageEvent;
    import com.sulake.habbo.communication.messages.incoming.room.session.RoomQueueStatusMessageEvent;

    public class IncomingMessages {

        private var _navigator:HabboTabletNavigator;
        private var _messageEvents:Vector.<IMessageEvent>;

        public function IncomingMessages(k:HabboTabletNavigator);

        public function dispose():void;

        private function onAuthenticationOk(k:AuthenticationOKMessageEvent):void;

        private function onUserFlatCats(k:UserFlatCatsEvent):void;

        private function onGuestRoomSearchResult(k:GuestRoomSearchResultEvent):void;

        private function onOfficialRooms(k:OfficialRoomsEvent):void;

        private function onError(k:GenericErrorEvent):void;

        private function onCloseConnection(k:CloseConnectionMessageEvent):void;

        private function onDoorbell(k:DoorbellMessageEvent):void;

        private function onDoorOpened(k:FlatAccessibleMessageEvent):void;

        private function onFlatAccessDenied(k:FlatAccessDeniedMessageEvent):void;

        private function onCantConnect(k:CantConnectMessageEvent):void;

        private function onRoomQueueStatus(k:RoomQueueStatusMessageEvent):void;

        private function onRoomForward(k:IMessageEvent):void;

        private function onFavourites(k:IMessageEvent):void;

        private function onNavigatorSettings(k:IMessageEvent):void;

        private function onRoomSettingsData(k:IMessageEvent):void;

        private function onRoomSettingsError(k:IMessageEvent):void;

        private function onFlatControllers(k:IMessageEvent):void;

        private function onBannedUsersFromRoom(k:IMessageEvent):void;

        private function onMessengerInit(k:IMessageEvent):void;

        private function onFriendListUpdate(k:IMessageEvent):void;

        private function onRoomSettingsSaved(k:IMessageEvent):void;

        private function onRoomSettingsSaveError(k:IMessageEvent):void;

        private function onCanCreateRoom(k:IMessageEvent):void;

        private function onFlatCreated(k:IMessageEvent):void;


    }
}//package com.sulake.habbo.tablet.navigator

