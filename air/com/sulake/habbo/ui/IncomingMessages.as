//com.sulake.habbo.ui.IncomingMessages

package com.sulake.habbo.ui{
    import __AS3__.vec.Vector;
    import com.sulake.habbo.messenger.ConversationMessage;
    import com.sulake.habbo.notification.MessageDisplay;
    import com.sulake.habbo.communication.IHabboCommunicationManager;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.incoming.room.furniture.RoomMessageNotificationMessageEvent;
    import com.sulake.habbo.communication.messages.incoming.notifications.NotificationDialogMessageEvent;

    [SecureSWF(rename="true")]
    public class IncomingMessages {

        private static var _bufferedMessengerMessages:Vector.<ConversationMessage>;

        private var _ui:HabboUI;
        private var _messageDisplay:MessageDisplay;
        private var _communication:IHabboCommunicationManager;
        private var _messageEvents:Vector.<IMessageEvent>;

        public function IncomingMessages(k:HabboUI, _arg_2:MessageDisplay, _arg_3:IHabboCommunicationManager);

        public static function purgeBufferedMessengerMessages():Vector.<ConversationMessage>;


        private function addMessageEvent(k:IMessageEvent):void;

        public function dispose():void;

        private function onAuthenticationOK(k:IMessageEvent):void;

        private function onMOTD(k:IMessageEvent):void;

        private function onFriendRequests(k:IMessageEvent):void;

        private function onNewConsoleMessage(k:IMessageEvent):void;

        public function onHabboSearchResult(k:IMessageEvent):void;

        public function onFollowFriendFailed(k:IMessageEvent):void;

        public function onBadges(k:IMessageEvent):void;

        private function onBadgePointLimits(k:IMessageEvent):void;

        private function onRoomMessagesNotification(k:RoomMessageNotificationMessageEvent):void;

        private function onModMessageEvent(k:IMessageEvent):void;

        private function onUserBannedMessageEvent(k:IMessageEvent):void;

        private function onHotelClosing(k:IMessageEvent):void;

        private function onBroadcastMessageEvent(k:IMessageEvent):void;

        private function onNotificationDialogMessageEvent(k:NotificationDialogMessageEvent):void;


    }
}//package com.sulake.habbo.ui

