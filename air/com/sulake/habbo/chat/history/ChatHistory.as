//com.sulake.habbo.chat.history.ChatHistory

package com.sulake.habbo.chat.history{
    import com.sulake.habbo.chat.Chat;
    import feathers.controls.List;
    import starling.display.Image;
    import feathers.core.FeathersControl;
    import starling.events.Event;
    import starling.display.DisplayObject;
    import starling.events.TouchEvent;

    public class ChatHistory {

        private var _chat:Chat;
        private var _lines:List;
        private var _modalOverlay:Image;

        public function ChatHistory(k:Chat);

        public function dispose():void;

        public function get view():FeathersControl;

        public function hide():void;

        private function createView():void;

        private function onChatUpdate(k:Event):void;

        public function modalOverlay():DisplayObject;

        private function onModalOverlayTouch(k:TouchEvent):void;


    }
}//package com.sulake.habbo.chat.history

