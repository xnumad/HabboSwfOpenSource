//com.sulake.habbo.chat.input.ChatInput

package com.sulake.habbo.chat.input{
    import com.sulake.habbo.chat.Chat;
    import feathers.controls.LayoutGroup;
    import starling.display.Button;
    import feathers.controls.TextInput;
    import feathers.controls.PickerList;
    import feathers.controls.ImageLoader;
    import starling.display.Quad;
    import feathers.core.FeathersControl;
    import feathers.data.ListCollection;
    import starling.events.Event;
    import org.gestouch.events.GestureEvent;
    import starling.events.TouchEvent;

    public class ChatInput {

        private static const LONG_PRESS_TIME_MS:int;
        private static const STATE_INACTIVE:int;
        private static const STATE_ACTIVE:int;
        private static const CHAT_TYPE_SPEAK:String;
        private static const CHAT_TYPE_SHOUT:String;
        private static const CHAT_TYPE_WHISPER:String;
        private static var _isPinned:Boolean;

        private var _chat:Chat;
        private var _idleView:LayoutGroup;
        private var _typingView:LayoutGroup;
        private var _chatCommands:ChatCommands;
        private var _inputIcon:Button;
        private var _input:TextInput;
        private var _typePicker:PickerList;
        private var _pin:ImageLoader;
        private var _activeBg:Quad;
        private var _state:int;
        private var _whisperToUserNames:Array;
        private var _skipInputOpen:Boolean;
        private var _disposed:Boolean;

        public function ChatInput(k:Chat);

        public function dispose():void;

        public function get view():FeathersControl;

        public function set visible(k:Boolean):void;

        public function addUserToWhisper(k:String):void;

        private function updateChatTypeList():ListCollection;

        private function createView():void;

        private function onInitialize(k:Event):void;

        private function onInputIcon(k:Event):void;

        private function onLongPressBegan(k:GestureEvent):void;

        private function onChatTypeChange(k:Event):void;

        private function onPinTouch(k:TouchEvent):void;

        private function onKeyboardEnterKey(k:Event):void;

        public function setActiveState():void;

        private function setInactiveState():void;

        private function requestInputFocus():void;

        private function sendChatMessage():Boolean;

        private function getActiveBg():Quad;

        private function onBgTouch(k:TouchEvent):void;


    }
}//package com.sulake.habbo.chat.input

