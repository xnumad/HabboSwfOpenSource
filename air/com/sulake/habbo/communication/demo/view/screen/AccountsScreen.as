//com.sulake.habbo.communication.demo.view.screen.AccountsScreen

package com.sulake.habbo.communication.demo.view.screen{
    import feathers.controls.PanelScreen;
    import feathers.controls.List;
    import feathers.controls.Label;
    import feathers.controls.Button;
    import com.sulake.habbo.communication.demo.view.TabletLoginView;
    import flash.utils.Dictionary;
    import starling.textures.Texture;
    import starling.events.Event;

    public class AccountsScreen extends PanelScreen implements ILoginScreen {

        private var _list:List;
        private var _chooseLabel:Label;
        private var _informationLabel:Label;
        private var _continueButton:Button;
        private var _loginListener:TabletLoginView;
        private var _initialized:Boolean;
        private var _accounts:Dictionary;
        private var _selectedIndex:int;
        private var _normalUserTexture:Texture;
        private var _selectedUserTexture:Texture;
        private var _accessoryTexture:Texture;

        public function AccountsScreen(k:TabletLoginView);

        override public function dispose():void;

        private function initializeHandler(k:Event):void;

        public function updateLocalizations():void;

        private function onListChange(k:Event):void;

        public function populateList(k:Dictionary):void;

        private function onContinue(k:Event):void;


    }
}//package com.sulake.habbo.communication.demo.view.screen

