//com.sulake.habbo.communication.demo.view.screen.EnvironmentScreen

package com.sulake.habbo.communication.demo.view.screen{
    import feathers.controls.PanelScreen;
    import feathers.controls.List;
    import feathers.controls.Button;
    import feathers.controls.Label;
    import com.sulake.habbo.communication.demo.view.TabletLoginView;
    import com.sulake.habbo.communication.demo.HabboCommunicationDemo;
    import starling.textures.Texture;
    import starling.events.Event;

    public class EnvironmentScreen extends PanelScreen implements ILoginScreen {

        private var _list:List;
        private var _continueButton:Button;
        private var _startLabel:Label;
        private var _chooseLabel:Label;
        private var _initialized:Boolean;
        private var _loginView:TabletLoginView;
        private var _controller:HabboCommunicationDemo;
        private var _accessoryTexture:Texture;

        public function EnvironmentScreen(k:TabletLoginView, _arg_2:HabboCommunicationDemo);

        override public function dispose():void;

        private function initializeHandler(k:Event):void;

        private function onListChange(k:Event):void;

        private function onContinue(k:Event):void;

        public function updateLocalizations():void;


    }
}//package com.sulake.habbo.communication.demo.view.screen

