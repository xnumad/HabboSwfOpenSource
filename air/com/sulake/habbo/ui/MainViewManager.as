//com.sulake.habbo.ui.MainViewManager

package com.sulake.habbo.ui{
    import starling.core.Starling;
    import feathers.controls.LayoutGroup;
    import starling.display.Sprite;
    import __AS3__.vec.Vector;
    import com.sulake.habbo.ui.state.State;
    import flash.text.TextField;
    import starling.display.DisplayObjectContainer;

    public class MainViewManager {

        public static const VIEW_LAYER_LANDING:int;
        public static const VIEW_LAYER_ROOM:int;
        public static const VIEW_LAYER_UI:int;
        private static const ALL_COMPONENTS:Array;
        private static const UI_COMPONENT_TOOLBAR:int;

        private var _habboUI:HabboUI;
        private var _starling:Starling;
        private var _landingLayer:LayoutGroup;
        private var _roomLayer:Sprite;
        private var _UILayer:LayoutGroup;
        private var _states:Vector.<State>;
        private var _currentViewState:State;
        private var _debugOverlay:TextField;

        public function MainViewManager(k:HabboUI, _arg_2:Starling);

        private function prepareStates():void;

        public function showMainViewState(k:int):void;

        private function showState(k:int):void;

        private function hideState(k:int):void;

        private function showComponent(k:int):void;

        private function hideComponent(k:int):void;

        public function get viewStateId():int;

        private function showToolbar():void;

        private function hideToolbar():void;

        private function showRoomView():void;

        private function hideRoomView():void;

        private function showNavigator():void;

        private function hideNavigator():void;

        private function showFriends():void;

        private function showAccounts():void;

        public function hideFriends():void;

        private function showHotelView():void;

        private function hideHotelView():void;

        private function showInventory():void;

        private function hideInventory():void;

        private function showCatalog():void;

        private function hideCatalog():void;

        private function showMessenger():void;

        private function hideMessenger():void;

        private function showAvatarEditor():void;

        private function hideAvatarEditor():void;

        private function prepareViewLayers():void;

        public function toggleDebugOverlay():void;

        public function dispose():void;

        public function getViewLayer(k:int):DisplayObjectContainer;


    }
}//package com.sulake.habbo.ui

