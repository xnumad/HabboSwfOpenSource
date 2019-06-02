//com.sulake.habbo.profile.avatar.slot.AvatarDetailsSlot

package com.sulake.habbo.profile.avatar.slot{
    import com.sulake.habbo.localization.IHabboLocalizationManager;
    import feathers.controls.LayoutGroup;
    import feathers.controls.Label;
    import feathers.controls.ImageLoader;
    import com.sulake.habbo.communication.messages.incoming.users.ExtendedProfileData;

    public class AvatarDetailsSlot {

        private var _localization:IHabboLocalizationManager;
        private var _view:LayoutGroup;
        private var _userName:Label;
        private var _motto:Label;
        private var _achievementScore:Label;
        private var _created:Label;
        private var _lastLogin:Label;
        private var _onlineStatus:ImageLoader;

        public function AvatarDetailsSlot(k:IHabboLocalizationManager);

        public function dispose():void;

        public function get view():LayoutGroup;

        private function createView():void;

        public function set achievementScore(k:int):void;

        public function setData(k:ExtendedProfileData):void;

        public function set userName(k:String):void;

        public function set motto(k:String):void;

        public function setOnlineStatus(k:Boolean, _arg_2:int):void;

        public function set createdDate(k:String):void;


    }
}//package com.sulake.habbo.profile.avatar.slot

