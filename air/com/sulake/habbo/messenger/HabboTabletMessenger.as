//com.sulake.habbo.messenger.HabboTabletMessenger

package com.sulake.habbo.messenger{
    import com.sulake.habbo.avatar.IAvatarImageListener;
    import com.sulake.habbo.localization.IHabboLocalizationManager;
    import com.sulake.habbo.ui.HabboUI;
    import com.sulake.habbo.communication.IHabboCommunicationManager;
    import com.sulake.habbo.session.ISessionDataManager;
    import com.sulake.habbo.messenger.view.MainView;
    import __AS3__.vec.Vector;
    import com.sulake.core.communication.messages.IMessageEvent;
    import feathers.data.ListCollection;
    import starling.display.DisplayObject;
    import com.sulake.habbo.friends.FriendOnlineStatusEvent;
    import com.sulake.core.communication.messages.IMessageComposer;
    import com.sulake.habbo.communication.messages.incoming.friendlist.NewConsoleMessageEvent;
    import com.sulake.habbo.communication.messages.incoming.friendlist.RoomInviteEvent;

    public class HabboTabletMessenger implements IAvatarImageListener {

        private static const TIMESTAMP_THRESHOLD_SECONDS:int;
        private static var _localization:IHabboLocalizationManager;

        private var _habboUI:HabboUI;
        private var _communication:IHabboCommunicationManager;
        private var _sessionDataManager:ISessionDataManager;
        private var _mainView:MainView;
        private var _messageEvents:Vector.<IMessageEvent>;
        private var _conversations:ListCollection;
        private var _isDisposed:Boolean;

        public function HabboTabletMessenger(k:HabboUI, _arg_2:IHabboCommunicationManager, _arg_3:IHabboLocalizationManager, _arg_4:ISessionDataManager);

        public static function get localization():IHabboLocalizationManager;


        public function dispose():void;

        public function get disposed():Boolean;

        public function get communication():IHabboCommunicationManager;

        public function isViewLoaded():Boolean;

        public function get view():DisplayObject;

        public function requestViewClosing():void;

        public function onFriendOnlineStatus(k:FriendOnlineStatusEvent):void;

        public function send(k:IMessageComposer):void;

        public function showConversation(k:Conversation):void;

        public function startConversation(k:int):Conversation;

        private function createConversation(k:int):Conversation;

        public function endConversation(k:int):void;

        public function hasConversationId(k:int):Boolean;

        private function onNewConsoleMessage(k:NewConsoleMessageEvent):void;

        private function getConversation(k:int):Conversation;

        private function markConversationUpdated(k:Conversation):void;

        private function dispatchUnseenMessageUpdate():void;

        public function hasUnseenMessages():Boolean;

        private function onRoomInvite(k:RoomInviteEvent):void;

        private function onInstantMessageError(k:IMessageEvent):void;

        public function get habboUI():HabboUI;

        public function get sessionDataManager():ISessionDataManager;

        private function addMessageEvent(k:IMessageEvent):void;

        public function get conversations():ListCollection;

        public function avatarImageReady(k:String):void;


    }
}//package com.sulake.habbo.messenger

