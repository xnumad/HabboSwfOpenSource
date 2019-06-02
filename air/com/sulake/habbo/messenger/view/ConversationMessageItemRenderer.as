//com.sulake.habbo.messenger.view.ConversationMessageItemRenderer

package com.sulake.habbo.messenger.view{
    import feathers.controls.renderers.LayoutGroupListItemRenderer;
    import feathers.display.Scale9Image;
    import feathers.controls.Label;
    import com.sulake.habbo.messenger.ConversationMessage;

    public class ConversationMessageItemRenderer extends LayoutGroupListItemRenderer {

        private static const TEXT_MARGIN_NARROW:int;
        private static const TEXT_MARGIN_WIDE:int;
        private static const TEXT_MAX_WIDTH_MESSAGE:int;
        private static const TEXT_MIN_WIDTH_MESSAGE:int;

        private var _bg:Scale9Image;
        private var _message:Label;

        public function ConversationMessageItemRenderer();

        override protected function initialize():void;

        override public function set data(k:Object):void;

        private function get messageData():ConversationMessage;

        override protected function draw():void;

        override protected function commitData():void;

        private function setTypePeer():void;

        private function setTypeMe():void;

        private function setTypeInfo():void;

        private function alignElements(k:int, _arg_2:int, _arg_3:int, _arg_4:int):void;


    }
}//package com.sulake.habbo.messenger.view

