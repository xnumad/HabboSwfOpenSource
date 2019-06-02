//com.sulake.habbo.communication.demo.view.screen.SelectAvatarScreen

package com.sulake.habbo.communication.demo.view.screen{
    import feathers.controls.PanelScreen;
    import com.sulake.habbo.communication.demo.HabboCommunicationDemo;
    import com.sulake.habbo.communication.demo.view.TabletLoginView;
    import feathers.controls.Button;
    import feathers.controls.Label;
    import feathers.controls.ImageLoader;
    import feathers.controls.TextInput;
    import feathers.controls.PickerList;
    import starling.display.Quad;
    import starling.events.Event;
    import starling.events.TouchEvent;

    public class SelectAvatarScreen extends PanelScreen implements ILoginScreen {

        private var _controller:HabboCommunicationDemo;
        private var _loginView:TabletLoginView;
        private var _backButton:Button;
        private var _titleLabel:Label;
        private var _informationLabel:Label;
        private var _initialized:Boolean;
        private var _promoHabbosData:Array;
        private var _avatarImage:ImageLoader;
        private var _index:int;
        private var _avatarData:Object;
        private var _avatarNameTitle:Label;
        private var _avatarNameInfo:Label;
        private var _avatarNameInput:TextInput;
        private var _gender:Label;
        private var _genderPicker:PickerList;
        private var _registerButton:Button;

        public function SelectAvatarScreen(k:TabletLoginView, _arg_2:HabboCommunicationDemo);

        private static function createSeparator(k:int, _arg_2:int):Quad;


        public function updateLocalizations():void;

        override public function dispose():void;

        private function initializeHandler(k:Event):void;

        private function onShowNextAvatar(k:TouchEvent):void;

        private function onGoBack(k:Event):void;

        private function onCheckName(k:Event):void;

        public function showHabbos(k:Array):void;

        private function onPickerChanged(k:Event):void;

        private function showCurrentAvatar():void;

        public function set avatarData(k:Object):void;

        private function update():void;

        public function nameCheckResponse(k:Object):void;

        private function showNameError(k:String):void;


    }
}//package com.sulake.habbo.communication.demo.view.screen

