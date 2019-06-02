//com.sulake.habbo.messenger.view.MainView

package com.sulake.habbo.messenger.view{
    import com.sulake.habbo.messenger.HabboTabletMessenger;
    import feathers.controls.LayoutGroup;
    import starling.display.DisplayObject;
    import com.sulake.habbo.messenger.Conversation;
    import starling.events.Event;

    public class MainView {

        private static const TITLE_TOP:int;
        private static const CONVERSATIONS_TOP:int;
        private static const CONVERSATION_TOP:int;
        private static const MIDDLE:int;
        private static const MARGIN:int;

        private var _messenger:HabboTabletMessenger;
        private var _view:LayoutGroup;
        private var _conversationsSlot:ConversationsSlot;
        private var _conversationSlot:ConversationSlot;
        private var _search:MessengerSearch;

        public function MainView(k:HabboTabletMessenger);

        public function dispose():void;

        public function get view():DisplayObject;

        public function hasView():Boolean;

        public function scrollToConversation(k:Conversation):void;

        public function showConversation(k:Conversation):void;

        public function get currentConversationReferenceId():int;

        public function updatePeerOnlineStatus():void;

        public function updatePeerAvatar():void;

        public function getSelected():Conversation;

        private function onConversationRemoved(k:Event):void;

        public function createView():void;

        private function onCloseButton(k:Event):void;


    }
}//package com.sulake.habbo.messenger.view

