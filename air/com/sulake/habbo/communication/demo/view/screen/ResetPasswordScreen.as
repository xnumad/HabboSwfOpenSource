//com.sulake.habbo.communication.demo.view.screen.ResetPasswordScreen

package com.sulake.habbo.communication.demo.view.screen{
    import feathers.controls.PanelScreen;
    import com.sulake.habbo.communication.demo.view.TabletLoginView;
    import feathers.controls.Label;
    import feathers.controls.TextInput;
    import feathers.controls.Button;
    import starling.events.Event;

    public class ResetPasswordScreen extends PanelScreen implements ILoginScreen {

        private var _loginView:TabletLoginView;
        private var _description:Label;
        private var _title:Label;
        private var _input:TextInput;
        private var _loginButton:Button;
        private var _backButton:Button;
        private var _initialized:Boolean;

        public function ResetPasswordScreen(k:TabletLoginView);

        override public function dispose():void;

        private function initializeHandler(k:Event):void;

        private function onNameEnterKey(k:Event):void;

        public function updateLocalizations():void;

        private function onGoBack(k:Event):void;

        private function onSendReminder(k:Event):void;


    }
}//package com.sulake.habbo.communication.demo.view.screen

