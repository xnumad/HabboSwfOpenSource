//com.sulake.habbo.tablet.navigator.RoomDetailsView

package com.sulake.habbo.tablet.navigator{
    import feathers.controls.LayoutGroup;
    import com.sulake.habbo.communication.messages.incoming.navigator.GuestRoomData;
    import feathers.controls.Label;
    import feathers.controls.Button;
    import feathers.controls.TextInput;
    import starling.events.Event;

    public class RoomDetailsView extends LayoutGroup {

        private static const WIDTH:int;

        private var _navigator:HabboTabletNavigator;
        private var _roomData:GuestRoomData;
        private var _roomName:Label;
        private var _owner:Label;
        private var _description:Label;
        private var _groupName:Label;
        private var _favouriteButton:Button;
        private var _addHomeButton:Button;
        private var _settingsButton:Button;
        private var _doorModeInfo:Label;
        private var _goToRoomButton:Button;
        private var _doorbellButton:Button;
        private var _passwordButton:Button;
        private var _passwordField:TextInput;

        public function RoomDetailsView(k:HabboTabletNavigator);

        private static function updateButtonImage(k:Button, _arg_2:String):void;


        override public function dispose():void;

        private function onSettingsButton(k:Event):void;

        private function updateSettingsButton():void;

        private function onAddHomeButton(k:Event):void;

        private function onFavouriteButton(k:Event):void;

        private function toggleFavourite():void;

        private function updateFavouriteImage():void;

        private function updateHomeImage():void;

        private function onGoToRoom(k:Event):void;

        private function onDoorbell(k:Event):void;

        private function onPassword(k:Event):void;

        public function update(k:GuestRoomData):void;

        private function updateLayoutContent():void;

        public function showDoorbellRinging():void;

        public function showDoorbellNoAnswer():void;


    }
}//package com.sulake.habbo.tablet.navigator

