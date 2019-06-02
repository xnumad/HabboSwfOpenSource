//com.sulake.habbo.avatareditor.view.WardrobeView

package com.sulake.habbo.avatareditor.view{
    import com.sulake.habbo.avatareditor.HabboTabletAvatarEditor;
    import feathers.controls.LayoutGroup;
    import feathers.data.ListCollection;
    import feathers.controls.List;
    import feathers.controls.Button;
    import __AS3__.vec.Vector;
    import feathers.core.FeathersControl;
    import starling.events.Event;
    import starling.display.DisplayObject;

    public class WardrobeView {

        private static const BUTTON_DIMENSION:int;
        public static const MODE_RETRIEVE:int;
        public static const MODE_STORE:int;

        private var _avatarEditor:HabboTabletAvatarEditor;
        private var _view:LayoutGroup;
        private var _layouts:ListCollection;
        private var _list:List;
        private var _useSlotButton:Button;
        private var _cancelBtn:Button;
        private var _mode:int;
        private var _state:int;
        private var _lastSelectedSlotFigure:String;
        private var _lastSelectedSlotGender:String;
        private var _lastSelectedOutfit:Outfit;

        public function WardrobeView(k:HabboTabletAvatarEditor, _arg_2:int, _arg_3:Vector.<Outfit>, _arg_4:int);

        public function dispose():void;

        public function get view():FeathersControl;

        private function createView():void;

        private function onCancel(k:Event):void;

        private function onUseSlot(k:Event):void;

        private function productButtonFactory():OutfitButton;

        private function onListSelectionChange(k:Event):void;

        private function calloutClubPromo(k:DisplayObject):void;

        private function onGetClubBtn(k:Event):void;

        private function calloutText(k:DisplayObject, _arg_2:String):void;


    }
}//package com.sulake.habbo.avatareditor.view

