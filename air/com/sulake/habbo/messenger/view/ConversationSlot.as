//com.sulake.habbo.messenger.view.ConversationSlot

package com.sulake.habbo.messenger.view{
    import feathers.controls.LayoutGroup;
    import com.sulake.habbo.messenger.HabboTabletMessenger;
    import feathers.controls.ImageLoader;
    import feathers.controls.Label;
    import feathers.controls.List;
    import feathers.controls.TextInput;
    import com.sulake.habbo.messenger.Conversation;
    import feathers.layout.AnchorLayoutData;
    import starling.events.Event;

    public class ConversationSlot extends LayoutGroup {

        private var _messenger:HabboTabletMessenger;
        private var _conversationReferenceId:int;
        private var _online:ImageLoader;
        private var _name:Label;
        private var _avatarHead:ImageLoader;
        private var _list:List;
        private var _input:TextInput;
        private var _conversation:Conversation;
        private var _inputDeactiveLD:AnchorLayoutData;
        private var _inputActiveLD:AnchorLayoutData;

        public function ConversationSlot(k:HabboTabletMessenger);

        override public function dispose():void;

        public function set conversation(k:Conversation):void;

        public function get conversationReferenceId():int;

        private function createView():void;

        private function updateTitle(k:String):void;

        public function updatePeerOnlineStatus():void;

        public function updatePeerAvatar():void;

        private function scrollToLastMessage(k:Boolean):void;

        private function onInputActive(k:Event):void;

        private function onInputDeactive(k:Event):void;

        private function onNewMessages(k:Event):void;

        private function onKeyboardEnterKey(k:Event):void;


    }
}//package com.sulake.habbo.messenger.view

