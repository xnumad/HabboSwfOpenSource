//com.sulake.habbo.communication.demo.view.screen.CreateAccountScreen

package com.sulake.habbo.communication.demo.view.screen{
    import feathers.controls.PanelScreen;
    import com.sulake.habbo.communication.demo.HabboCommunicationDemo;
    import com.sulake.habbo.communication.demo.view.TabletLoginView;
    import feathers.controls.Button;
    import feathers.controls.Label;
    import feathers.controls.TextInput;
    import feathers.controls.Check;
    import starling.display.Image;
    import feathers.controls.LayoutGroup;
    import feathers.controls.ScrollContainer;
    import starling.display.Quad;
    import starling.events.Event;
    import starling.display.DisplayObject;
    import starling.events.TouchEvent;

    public class CreateAccountScreen extends PanelScreen implements ILoginScreen {

        private static const POPUP_BIRTHDAY_BAN:int;
        private static const POPUP_BIRTHDAY:int;

        private var _controller:HabboCommunicationDemo;
        private var _loginView:TabletLoginView;
        private var _backButton:Button;
        private var _titleLabel:Label;
        private var _informationLabel:Label;
        private var _emailTitle:Label;
        private var _emailInfo:Label;
        private var _emailInput:TextInput;
        private var _passwordTitle:Label;
        private var _passwordInfo:Label;
        private var _passwordInput:TextInput;
        private var _dateOfBirthTitle:Label;
        private var _dateOfBirthInfo:Label;
        private var _datePicker:DatePicker;
        private var _initialized:Boolean;
        private var _registerButtton:Button;
        private var _marketingCheck:Check;
        private var _tosCheck:Check;
        private var _tosAgreed:Boolean;
        private var _modalOverlay:Image;
        private var _parentEmail:LayoutGroup;
        private var _parentEmailTitle:Label;
        private var _parentEmailInfo:Label;
        private var _parentEmailInput:TextInput;
        private var _parentEmailButtton:Button;
        private var _currentPopup:LayoutGroup;
        private var _birthdayBan:LayoutGroup;
        private var _birthdayBanTitle:Label;
        private var _birthdayBanInfo:Label;
        private var _birthdayBanButtton:Button;
        private var _birthDayPopupState:int;
        private var _tosLink:Label;
        private var _scrollContainer:ScrollContainer;

        public function CreateAccountScreen(k:TabletLoginView, _arg_2:HabboCommunicationDemo);

        private static function createSeparator(k:int, _arg_2:int):Quad;


        public function updateLocalizations():void;

        override public function dispose():void;

        private function initializeHandler(k:Event):void;

        private function askParentEmail():void;

        private function birthdayBanPopup(k:String, _arg_2:String, _arg_3:int):void;

        public function modalOverlay():DisplayObject;

        private function onRemovedFromStage(k:Event):void;

        private function onModalOverlayTouch(k:TouchEvent):void;

        private function onParentEmailOK(k:Event):void;

        private function onBodBanOK(k:Event):void;

        private function onGoBack(k:Event):void;

        private function onEmailEnterKey(k:Event):void;

        private function onInputFocus(k:Event):void;

        private function onParentEmailEnterKey(k:Event):void;

        private function onPasswordEnterKey(k:Event):void;

        private function onDoRegister(k:Event):void;

        private function invalidTos():void;

        private function invalidDate():void;

        private function showUnknownError():void;

        private function invalidPassword():void;

        private function invalidEmail(k:Boolean=false):void;

        public function storeCredentials():void;

        private function resetView():void;

        public function displayError(k:Object):void;

        public function resetInputs():void;

        private function onTOSClicked(k:TouchEvent):void;


    }
}//package com.sulake.habbo.communication.demo.view.screen

