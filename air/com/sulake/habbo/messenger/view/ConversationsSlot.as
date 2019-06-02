//com.sulake.habbo.messenger.view.ConversationsSlot

package com.sulake.habbo.messenger.view{
    import feathers.controls.LayoutGroup;
    import com.sulake.habbo.messenger.HabboTabletMessenger;
    import com.sulake.habbo.ui.HabboUI;
    import com.sulake.habbo.session.ISessionDataManager;
    import com.sulake.feathers.controls.Accordion;
    import com.sulake.habbo.messenger.Conversation;
    import starling.events.Event;

    public class ConversationsSlot extends LayoutGroup {

        private var _messenger:HabboTabletMessenger;
        private var _habboUI:HabboUI;
        private var _sessionDataManager:ISessionDataManager;
        private var _list:Accordion;

        public function ConversationsSlot(k:HabboTabletMessenger, _arg_2:HabboUI, _arg_3:ISessionDataManager);

        override public function dispose():void;

        public function scrollToConversation(k:Conversation):void;

        public function setSelected(k:Conversation):void;

        public function getSelected():Conversation;

        private function createView():void;

        private function onListChange(k:Event):void;

        private function onActionSelected(k:Event):void;


    }
}//package com.sulake.habbo.messenger.view

