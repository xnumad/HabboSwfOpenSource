//com.sulake.habbo.tablet.navigator.settings.UserRightsView

package com.sulake.habbo.tablet.navigator.settings{
    import feathers.controls.LayoutGroup;
    import com.sulake.habbo.tablet.navigator.HabboTabletNavigator;
    import feathers.controls.List;
    import feathers.controls.PickerList;
    import com.sulake.core.utils.Map;
    import com.sulake.habbo.session.IUserData;
    import com.sulake.habbo.communication.messages.incoming.roomsettings.FlatControllerData;
    import starling.display.DisplayObject;
    import feathers.controls.ImageLoader;
    import starling.events.TouchEvent;
    import starling.events.Event;

    public class UserRightsView extends LayoutGroup {

        private var _navigator:HabboTabletNavigator;
        private var _view:LayoutGroup;
        private var _controllers:List;
        private var _friends:PickerList;
        private var _userHistory:PickerList;
        private var _cachedAccessories:Map;
        private var _roomId:int;

        public function UserRightsView(k:HabboTabletNavigator, _arg_2:int);

        private static function sortOnUserName(k:IUserData, _arg_2:IUserData):Number;


        override public function dispose():void;

        public function get view():LayoutGroup;

        public function populateControllers(k:Array):void;

        public function populateFriends(k:Array):void;

        private function createError(k:String):void;

        private function createView():void;

        private function accessoryFunction(k:FlatControllerData):DisplayObject;

        private function createAccessory():ImageLoader;

        private function onAccessoryTouch(k:TouchEvent):void;

        private function onFriendSelected(k:Event):void;

        private function onRoomUserSelected(k:Event):void;

        private function giveRightsToUser(k:int, _arg_2:String):void;


    }
}//package com.sulake.habbo.tablet.navigator.settings

