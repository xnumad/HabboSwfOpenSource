//com.sulake.habbo.accounts.AccountSelector

package com.sulake.habbo.accounts{
    import com.sulake.habbo.avatar.IAvatarRenderManager;
    import com.sulake.habbo.session.ISessionDataManager;
    import com.sulake.habbo.ui.HabboUI;
    import com.sulake.habbo.profile.avatar.slot.AvatarImageSlot;
    import com.sulake.habbo.profile.avatar.slot.AvatarDetailsSlot;
    import feathers.controls.LayoutGroup;
    import __AS3__.vec.Vector;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.IHabboCommunicationManager;
    import feathers.controls.Label;
    import feathers.controls.Button;
    import starling.display.DisplayObject;
    import starling.events.Event;
    import com.sulake.habbo.communication.messages.incoming.users.ExtendedProfileMessageEvent;
    import starling.events.TouchEvent;

    public class AccountSelector {

        private var _avatarRenderManager:IAvatarRenderManager;
        private var _sessionDataManager:ISessionDataManager;
        private var _habboUI:HabboUI;
        private var _avatarSlot:AvatarImageSlot;
        private var _accountsSlot:AccountsSlot;
        private var _detailsSlot:AvatarDetailsSlot;
        private var _mainContainer:LayoutGroup;
        private var _userDataContainer:LayoutGroup;
        private var _currentUserId:int;
        private var _disposed:Boolean;
        private var _msgEvents:Vector.<IMessageEvent>;
        private var _communication:IHabboCommunicationManager;
        private var _tosLink:Label;
        private var _closeButton:Button;
        private var _selectButton:Button;
        private var _changeClothesButton:Button;

        public function AccountSelector(k:HabboUI, _arg_2:IHabboCommunicationManager, _arg_3:IAvatarRenderManager, _arg_4:ISessionDataManager);

        private static function createButton(k:LayoutGroup, _arg_2:String, _arg_3:Function, _arg_4:String=null):Button;


        public function dispose():void;

        public function get view():DisplayObject;

        private function hide():void;

        public function setup(k:int):void;

        private function createView():void;

        private function onCloseButton(k:Event):void;

        private function onSelectButton(k:Event):void;

        private function onChangeClothesButton(k:Event):void;

        private function onLogoutButton(k:Event):void;

        public function requestAccountDetails(k:int):void;

        private function addMessages():void;

        private function removeMessages():void;

        private function onProfile(k:ExtendedProfileMessageEvent):void;

        public function useAccount(k:int):void;

        private function onTOSClicked(k:TouchEvent):void;


    }
}//package com.sulake.habbo.accounts

