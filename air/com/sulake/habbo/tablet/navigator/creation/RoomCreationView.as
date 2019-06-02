//com.sulake.habbo.tablet.navigator.creation.RoomCreationView

package com.sulake.habbo.tablet.navigator.creation{
    import com.sulake.habbo.tablet.navigator.HabboTabletNavigator;
    import feathers.controls.LayoutGroup;
    import feathers.data.ListCollection;
    import feathers.controls.List;
    import feathers.controls.Button;
    import feathers.controls.TextInput;
    import feathers.controls.PickerList;
    import feathers.core.FeathersControl;
    import starling.events.Event;
    import starling.display.DisplayObject;

    public class RoomCreationView {

        private static const BUTTON_DIMENSION:int;

        private var _navigator:HabboTabletNavigator;
        private var _view:LayoutGroup;
        private var _layouts:ListCollection;
        private var _list:List;
        private var _createBtn:Button;
        private var _cancelBtn:Button;
        private var _name:TextInput;
        private var _category:PickerList;

        public function RoomCreationView(k:HabboTabletNavigator);

        public function dispose():void;

        public function get view():FeathersControl;

        private function createView():void;

        private function onCancel(k:Event):void;

        private function onCreate(k:Event):void;

        private function productButtonFactory():RoomLayoutButton;

        private function onListSelectionChange(k:Event):void;

        private function calloutClubPromo(k:DisplayObject):void;

        private function onGetClubBtn(k:Event):void;

        private function calloutText(k:DisplayObject, _arg_2:String):void;


    }
}//package com.sulake.habbo.tablet.navigator.creation

