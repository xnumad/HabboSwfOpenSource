//com.sulake.habbo.tablet.navigator.settings.UserBansView

package com.sulake.habbo.tablet.navigator.settings{
    import feathers.controls.LayoutGroup;
    import com.sulake.habbo.tablet.navigator.HabboTabletNavigator;
    import feathers.controls.List;
    import feathers.controls.PickerList;
    import com.sulake.core.utils.Map;
    import com.sulake.habbo.session.IUserData;
    import starling.events.Event;
    import com.sulake.habbo.communication.messages.incoming.roomsettings.BannedUserData;
    import starling.display.DisplayObject;
    import feathers.controls.ImageLoader;
    import starling.events.TouchEvent;

    public class UserBansView extends LayoutGroup {

        private var _navigator:HabboTabletNavigator;
        private var _view:LayoutGroup;
        private var _bans:List;
        private var _userHistory:PickerList;
        private var _cachedAccessories:Map;
        private var _roomId:int;

        public function UserBansView(k:HabboTabletNavigator, _arg_2:int);

        private static function sortOnUserName(k:IUserData, _arg_2:IUserData):Number;


        override public function dispose():void;

        public function get view():LayoutGroup;

        public function populateBans(k:Array):void;

        private function createView():void;

        private function onRoomUserSelected(k:Event):void;

        private function permBanUser(k:int, _arg_2:String):void;

        private function isUserBanned(k:int):Boolean;

        private function accessoryFunction(k:BannedUserData):DisplayObject;

        private function createAccessory():ImageLoader;

        private function onAccessoryTouch(k:TouchEvent):void;


    }
}//package com.sulake.habbo.tablet.navigator.settings

