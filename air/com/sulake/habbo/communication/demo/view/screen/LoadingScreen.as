//com.sulake.habbo.communication.demo.view.screen.LoadingScreen

package com.sulake.habbo.communication.demo.view.screen{
    import feathers.controls.PanelScreen;
    import com.sulake.habbo.communication.demo.view.TabletLoginView;
    import feathers.controls.Label;
    import starling.display.MovieClip;
    import starling.events.Event;

    public class LoadingScreen extends PanelScreen implements ILoginScreen {

        private var _loginView:TabletLoginView;
        private var _loadingLabel:Label;
        private var _loadingAnim:MovieClip;
        private var _initialized:Boolean;

        public function LoadingScreen(k:TabletLoginView);

        override public function dispose():void;

        public function updateLocalizations():void;

        private function onAddedToStage(k:Event):void;

        private function onRemovedFromStage(k:Event):void;

        private function initializeHandler(k:Event):void;


    }
}//package com.sulake.habbo.communication.demo.view.screen

