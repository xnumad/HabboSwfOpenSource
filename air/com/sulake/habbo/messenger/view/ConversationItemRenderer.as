//com.sulake.habbo.messenger.view.ConversationItemRenderer

package com.sulake.habbo.messenger.view{
    import com.sulake.feathers.controls.AccordionItem;
    import starling.animation.Tween;
    import feathers.controls.Button;
    import starling.events.Event;

    public class ConversationItemRenderer extends AccordionItem {

        private var _notificationTween:Tween;

        public function ConversationItemRenderer();

        override protected function updateIcon(k:Button, _arg_2:Object):void;

        private function removeNotificationTween(k:Button):void;

        private function addNotificationTween(k:Button):void;

        override protected function onExpansionButtonTriggered(k:Event):void;


    }
}//package com.sulake.habbo.messenger.view

