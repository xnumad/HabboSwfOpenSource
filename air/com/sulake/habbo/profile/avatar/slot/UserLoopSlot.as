//com.sulake.habbo.profile.avatar.slot.UserLoopSlot

package com.sulake.habbo.profile.avatar.slot{
    import com.sulake.habbo.profile.avatar.AvatarProfileCtrl;
    import com.sulake.habbo.session.IUserDataManager;
    import com.sulake.habbo.session.ISessionDataManager;
    import feathers.controls.LayoutGroup;
    import __AS3__.vec.Vector;
    import com.sulake.habbo.session.IUserData;
    import feathers.controls.PickerList;
    import starling.events.Event;

    public class UserLoopSlot {

        private var _profileCtrl:AvatarProfileCtrl;
        private var _userData:IUserDataManager;
        private var _session:ISessionDataManager;
        private var _view:LayoutGroup;
        private var _users:Vector.<IUserData>;
        private var _userPicker:PickerList;

        public function UserLoopSlot(k:AvatarProfileCtrl, _arg_2:ISessionDataManager, _arg_3:IUserDataManager=null);

        private static function sortOnUserName(k:IUserData, _arg_2:IUserData):Number;


        public function dispose():void;

        public function get view():LayoutGroup;

        public function set userDataManager(k:IUserDataManager):void;

        public function onUserIdUpdated():void;

        private function createView():void;

        private function onPickerListOpened(k:Event):void;

        private function selectUserId(k:int):void;

        private function onUserSelectedFromPicker(k:Event):void;

        private function onForwardButton(k:Event):void;

        private function onBackwardButton(k:Event):void;

        public function next():void;

        public function previous():void;

        private function updateUserIds():void;

        private function getCurrentIndex():int;


    }
}//package com.sulake.habbo.profile.avatar.slot

