//com.sulake.habbo.chat.Chat

package com.sulake.habbo.chat{
    import com.sulake.habbo.ui.RoomDesktop;
    import com.sulake.habbo.ui.HabboUI;
    import com.sulake.habbo.chat.discussion.data.RoomSessionEventHandler;
    import com.sulake.habbo.avatar.IAvatarRenderManager;
    import com.sulake.habbo.session.IRoomSessionManager;
    import com.sulake.habbo.room.IRoomEngine;
    import com.sulake.habbo.localization.IHabboLocalizationManager;
    import com.sulake.habbo.communication.IHabboCommunicationManager;
    import com.sulake.habbo.chat.discussion.viewer.ChatView;
    import com.sulake.habbo.chat.input.ChatInput;
    import com.sulake.habbo.chat.history.ChatHistory;
    import com.sulake.habbo.chat.discussion.viewer.BubbleFactory;
    import com.sulake.habbo.chat.discussion.data.ChatEventHandler;
    import feathers.data.ListCollection;
    import com.sulake.habbo.communication.messages.incoming.roomsettings.RoomChatSettings;
    import starling.events.Event;
    import com.sulake.habbo.communication.messages.incoming.navigator.GetGuestRoomResultEvent;
    import com.sulake.habbo.communication.messages.incoming.room.chat.RoomChatSettingsMessageEvent;
    import com.sulake.habbo.chat.discussion.data.ChatItem;

    public class Chat {

        private var _desktop:RoomDesktop;
        private var _habboUI:HabboUI;
        private var _roomSessionHandler:RoomSessionEventHandler;
        private var _avatarRenderManager:IAvatarRenderManager;
        private var _roomSessionManager:IRoomSessionManager;
        private var _roomEngine:IRoomEngine;
        private var _localizationManager:IHabboLocalizationManager;
        private var _communication:IHabboCommunicationManager;
        private var _chatView:ChatView;
        private var _chatInput:ChatInput;
        private var _chatHistory:ChatHistory;
        private var _chatBubbleFactory:BubbleFactory;
        private var _chatEventHandler:ChatEventHandler;
        private var _chatLineHistory:ListCollection;
        private var _isInRoom:Boolean;
        private var _roomChatSettings:RoomChatSettings;
        private var _disposed:Boolean;

        public function Chat(k:RoomDesktop, _arg_2:HabboUI, _arg_3:IAvatarRenderManager, _arg_4:IRoomSessionManager, _arg_5:IRoomEngine, _arg_6:IHabboLocalizationManager, _arg_7:IHabboCommunicationManager);

        public function dispose():void;

        private function onTextureCompress(k:Event):void;

        public function get habboUI():HabboUI;

        public function get roomSessionManager():IRoomSessionManager;

        public function get roomEngine():IRoomEngine;

        public function get avatarRenderManager():IAvatarRenderManager;

        public function get localizations():IHabboLocalizationManager;

        public function get communication():IHabboCommunicationManager;

        public function set visible(k:Boolean):void;

        private function onGuestRoomData(k:GetGuestRoomResultEvent):void;

        private function onRoomChatSettings(k:RoomChatSettingsMessageEvent):void;

        public function onRoomEntered():void;

        public function onRoomLeft():void;

        public function insertChat(k:ChatItem):void;

        private function recordChatHistory(k:ChatItem):void;

        public function get chatHistoryLines():ListCollection;

        public function get chatBubbleFactory():BubbleFactory;

        public function get chatView():ChatView;

        public function get chatInput():ChatInput;

        public function get chatHistory():ChatHistory;

        public function get roomChatSettings():RoomChatSettings;

        public function get desktop():RoomDesktop;


    }
}//package com.sulake.habbo.chat

