//com.sulake.habbo.communication.demo.view.screen.LoginScreen

package com.sulake.habbo.communication.demo.view.screen{
    import feathers.controls.PanelScreen;
    import com.sulake.habbo.communication.demo.view.TabletLoginView;
    import com.sulake.habbo.communication.demo.HabboCommunicationDemo;
    import feathers.controls.Label;
    import feathers.controls.TextInput;
    import feathers.controls.Button;
    import starling.events.Event;
    import starling.events.TouchEvent;

    public class LoginScreen extends PanelScreen implements ILoginScreen {

        private var _loginView:TabletLoginView;
        private var _controller:HabboCommunicationDemo;
        private var _linkPasswordLabel:Label;
        private var _linkAccountLabel:Label;
        private var _informationLabel:Label;
        private var _helpLabel:Label;
        private var _loginLabel:Label;
        private var _nameInput:TextInput;
        private var _passwordInput:TextInput;
        private var _loginButton:Button;
        private var _backButton:Button;
        private var _initialized:Boolean;

        public function LoginScreen(k:TabletLoginView, _arg_2:HabboCommunicationDemo);

        override public function dispose():void;

        private function initializeHandler(k:Event):void;

        public function updateLocalizations():void;

        private function onNameEnterKey(k:Event):void;

        private function onPasswordEnterKey(k:Event):void;

        private function onCreateAccount(k:TouchEvent):void;

        private function onForgotPassword(k:TouchEvent):void;

        private function onGoBack(k:Event):void;

        private function onDoLogin(k:Event):void;

        public function showLoginError():void;


    }
}//package com.sulake.habbo.communication.demo.view.screen

