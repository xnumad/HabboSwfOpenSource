//com.sulake.habbo.accounts.AccountsSlot

package com.sulake.habbo.accounts{
    import feathers.controls.LayoutGroup;
    import com.sulake.habbo.ui.HabboUI;
    import com.sulake.habbo.session.ISessionDataManager;
    import feathers.controls.List;
    import starling.textures.Texture;
    import flash.utils.Dictionary;
    import starling.events.Event;

    public class AccountsSlot extends LayoutGroup {

        private var _habboUI:HabboUI;
        private var _sessionDataManager:ISessionDataManager;
        private var _list:List;
        private var _selectedIndex:int;
        private var _normalUserTexture:Texture;
        private var _selectedUserTexture:Texture;
        private var _accessoryTexture:Texture;
        private var _accounts:Dictionary;
        private var _accountSelector:AccountSelector;

        public function AccountsSlot(k:AccountSelector, _arg_2:HabboUI, _arg_3:ISessionDataManager);

        override public function dispose():void;

        private function createView():void;

        private function onListChange(k:Event):void;

        public function update():void;

        private function populateList(k:Dictionary):void;


    }
}//package com.sulake.habbo.accounts

