//com.sulake.habbo.communication.demo.view.TabletLoginView

package com.sulake.habbo.communication.demo.view{
    import feathers.controls.ScreenNavigator;
    import feathers.motion.transitions.ScreenSlidingStackTransitionManager;
    import com.sulake.habbo.communication.demo.HabboCommunicationDemo;
    import com.sulake.habbo.communication.demo.view.screen.LoginScreen;
    import com.sulake.habbo.communication.demo.view.screen.EnvironmentScreen;
    import com.sulake.habbo.communication.demo.view.screen.AccountsScreen;
    import com.sulake.habbo.communication.demo.view.screen.DisconnectedScreen;
    import com.sulake.habbo.communication.demo.view.screen.LoadingScreen;
    import com.sulake.habbo.communication.demo.view.screen.CreateAccountScreen;
    import com.sulake.habbo.communication.demo.view.screen.SelectAvatarScreen;
    import com.sulake.habbo.communication.demo.view.screen.ResetPasswordScreen;
    import feathers.controls.ImageLoader;
    import feathers.controls.LayoutGroup;
    import com.sulake.core.utils.IFileProxy;
    import starling.display.DisplayObject;
    import flash.utils.Dictionary;
    import starling.events.Event;
    import feathers.controls.Button;

    public class TabletLoginView implements ILoginView {

        private static const LOGIN_TEASER_IMAGE:String;
        public static const LOGIN_ELEMENTS_WIDTH:int;
        public static const LOGIN_ELEMENTS_MARGIN:int;
        public static const LOGIN_SCREEN:String;
        public static const ENVIRONMENT_SCREEN:String;
        public static const CREATE_ACCOUNT_SCREEN:String;
        public static const SELECT_AVATAR_SCREEN:String;
        public static const ACCOUNTS_SCREEN:String;
        public static const DISCONNECTED_SCREEN:String;
        public static const LOADING_SCREEN:String;
        public static const RESET_PASSWORD_SCREEN:String;

        private var _navigator:ScreenNavigator;
        private var _transitionManager:ScreenSlidingStackTransitionManager;
        private var _controller:HabboCommunicationDemo;
        private var _loginScreen:LoginScreen;
        private var _environmentScreen:EnvironmentScreen;
        private var _accountsScreen:AccountsScreen;
        private var _disconnectedScreen:DisconnectedScreen;
        private var _loadingScreen:LoadingScreen;
        private var _createAccountScreen:CreateAccountScreen;
        private var _selectAvatarScreen:SelectAvatarScreen;
        private var _resetPasswordScreen:ResetPasswordScreen;
        private var _hotelTeaser:ImageLoader;
        private var _pageIcon:ImageLoader;
        private var _queuingToLoginView:Boolean;
        private var _disposed:Boolean;
        private var _view:LayoutGroup;

        public function TabletLoginView(k:HabboCommunicationDemo);

        private static function get fileProxy():IFileProxy;


        public function get view():DisplayObject;

        public function closeView():void;

        public function populateCharacterList(k:Dictionary):void;

        public function get disposed():Boolean;

        public function dispose():void;

        private function addedToStageHandler(k:Event):void;

        private function addTeaserImage():void;

        public function tryLogin(k:String, _arg_2:String):void;

        public function applyLogin(k:String, _arg_2:String):void;

        public function tryAccount(k:int):void;

        public function applyEnvironment(k:String):void;

        public function showLoginScreen():void;

        public function showDisconnected(k:int, _arg_2:String):void;

        public function showInvalidLoginError():void;

        public function showLoadingScreen():void;

        public function showEnvironmentSelect():void;

        public function showResetPassword():void;

        public function showCreateAccount():void;

        private function showScreen(k:String):void;

        public function showHotelTeaser(k:Boolean):void;

        public function createLoginElementGroup():LayoutGroup;

        public function updateAllLocalizations():void;

        public function createNavigationButtons(k:LayoutGroup, _arg_2:Button, _arg_3:String, _arg_4:Function, _arg_5:Button, _arg_6:String, _arg_7:Function):LayoutGroup;

        public function hidePageIcon():void;

        public function showPageIcon(k:String):void;

        public function showRegistrationError(k:Object):void;

        public function selectAvatar(k:Object):void;

        public function showPromoHabbos(k:Object):void;

        public function nameCheckResponse(k:Object):void;

        public function getProperty(k:String, _arg_2:Dictionary=null):String;

        public function avatarSelectionDone(k:Object):void;

        public function resetPocketSession():void;

        public function sendPasswordReminder(k:String):void;


    }
}//package com.sulake.habbo.communication.demo.view

