//com.sulake.habbo.toolbar.extension.development.DevelopmentMenu

package com.sulake.habbo.toolbar.extension.development{
    import com.sulake.habbo.toolbar.Toolbar;
    import com.sulake.habbo.room.IRoomEngine;
    import feathers.controls.LayoutGroup;
    import feathers.controls.TextInput;
    import feathers.controls.List;
    import starling.display.DisplayObject;
    import feathers.data.ListCollection;
    import starling.events.Event;

    public class DevelopmentMenu {

        private var _toolbar:Toolbar;
        private var _roomEngine:IRoomEngine;
        private var _view:LayoutGroup;
        private var _prompt:TextInput;
        private var _list:List;
        private var _isDisposed:Boolean;
        private var _lowMemCounter:int;

        public function DevelopmentMenu(k:Toolbar, _arg_2:IRoomEngine);

        public function dispose():void;

        public function get disposed():Boolean;

        public function get view():DisplayObject;

        private function createView():void;

        private function populateItems(k:ListCollection):void;

        private function createListItem(k:String, _arg_2:Function, _arg_3:Boolean):Object;

        private function onListChange(k:Event):void;

        private function onPromptEnterKey(k:Event):void;

        private function onClearPendingIAPTransactions():void;

        private function onClearCache():void;

        private function onReboot():void;

        private function onCatalogIndex():void;

        private function onCatalogIndexNormal():void;

        private function onForceTextureCompression():void;

        private function onToggleRoomDebug():void;

        private function onZoomChange():void;

        private function onWalkModeToggle():void;

        private function onToggleOverlay():void;

        private function onMessages():void;

        private function onAvatarEditor():void;

        private function onChatHistory():void;

        private function onCapabilities():void;

        private function onTriggerLowMem():void;


    }
}//package com.sulake.habbo.toolbar.extension.development

