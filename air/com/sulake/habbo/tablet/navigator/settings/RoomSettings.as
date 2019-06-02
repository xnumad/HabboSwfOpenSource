//com.sulake.habbo.tablet.navigator.settings.RoomSettings

package com.sulake.habbo.tablet.navigator.settings{
    import com.sulake.habbo.tablet.navigator.HabboTabletNavigator;
    import com.sulake.habbo.tablet.navigator.NavigatorViewController;
    import com.sulake.habbo.communication.messages.incoming.roomsettings.RoomSettingsData;
    import feathers.controls.LayoutGroup;
    import feathers.controls.ScrollContainer;
    import feathers.controls.Button;
    import feathers.controls.TextInput;
    import feathers.controls.PickerList;
    import feathers.core.ToggleGroup;
    import feathers.controls.Check;
    import starling.display.DisplayObjectContainer;
    import feathers.data.ListCollection;
    import feathers.core.FeathersControl;
    import starling.events.Event;

    public class RoomSettings {

        private var _navigator:HabboTabletNavigator;
        private var _viewCtrl:NavigatorViewController;
        private var _settingsData:RoomSettingsData;
        private var _view:LayoutGroup;
        private var _leftCont:ScrollContainer;
        private var _rightCont:ScrollContainer;
        private var _saveBtn:Button;
        private var _cancelBtn:Button;
        private var _name:TextInput;
        private var _description:TextInput;
        private var _category:PickerList;
        private var _trading:PickerList;
        private var _maxVisitors:PickerList;
        private var _doorMode:ToggleGroup;
        private var _availableDoorModes:Array;
        private var _password1:TextInput;
        private var _password2:TextInput;
        private var _allowPets:Check;
        private var _allowPetEat:Check;
        private var _allowWalkThrough:Check;
        private var _hideWalls:Check;
        private var _bans:PickerList;
        private var _kicks:PickerList;
        private var _mutes:PickerList;
        private var _floorThickness:PickerList;
        private var _wallThickness:PickerList;
        private var _userRights:UserRightsView;
        private var _userBans:UserBansView;

        public function RoomSettings(k:HabboTabletNavigator, _arg_2:NavigatorViewController, _arg_3:RoomSettingsData);

        private static function createPasswordInput(k:DisplayObjectContainer, _arg_2:String):TextInput;

        private static function createSettingGroup(k:DisplayObjectContainer, _arg_2:String, _arg_3:String="justify"):LayoutGroup;

        private static function createMultilineTextInput(k:DisplayObjectContainer, _arg_2:int, _arg_3:String):TextInput;

        private static function createTextInput(k:DisplayObjectContainer, _arg_2:String):TextInput;

        private static function createHeaderLabel(k:DisplayObjectContainer, _arg_2:String):void;

        private static function createDropDown(k:DisplayObjectContainer):PickerList;

        private static function createCheck(k:DisplayObjectContainer, _arg_2:String, _arg_3:Boolean):Check;

        private static function getSelectedIndex(k:ListCollection, _arg_2:int):int;


        public function dispose():void;

        public function get view():FeathersControl;

        private function close():void;

        private function populateFromData():void;

        public function populateRoomControllers(k:int, _arg_2:Array):void;

        public function populateRoomBans(k:int, _arg_2:Array):void;

        private function onSaveBtn(k:Event):void;

        private function onCancelButton(k:Event):void;

        private function onDeleteRoomButton(k:Event):void;

        private function onDeleteOk(k:Event):void;

        private function validate():Boolean;

        private function save():void;

        private function createView():void;

        private function createModDropDown(k:DisplayObjectContainer, _arg_2:int, _arg_3:Array):PickerList;

        private function createRightsView(k:DisplayObjectContainer):void;

        private function createBansView(k:DisplayObjectContainer):void;

        private function createCancelAndSave(k:DisplayObjectContainer):void;

        private function createFloorThicknessDropDown(k:DisplayObjectContainer, _arg_2:int, _arg_3:Boolean):PickerList;

        private function createWallThicknessDropDown(k:DisplayObjectContainer, _arg_2:int, _arg_3:Boolean):PickerList;

        private function createDoorModeToggleGroup(k:DisplayObjectContainer):ToggleGroup;

        private function createTradeModeDropDown(k:DisplayObjectContainer, _arg_2:int):PickerList;

        private function onDoorModeChange(k:Event):void;

        private function createMaxVisitorsDropDown(k:DisplayObjectContainer):PickerList;

        private function createCategoryDropDown(k:DisplayObjectContainer):PickerList;


    }
}//package com.sulake.habbo.tablet.navigator.settings

