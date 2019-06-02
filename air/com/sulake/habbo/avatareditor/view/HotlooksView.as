//com.sulake.habbo.avatareditor.view.HotlooksView

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

    public class HotlooksView {

        private static const BUTTON_DIMENSION:int;

        private var _avatarEditor:HabboTabletAvatarEditor;
        private var _view:LayoutGroup;
        private var _layouts:ListCollection;
        private var _list:List;
        private var _createBtn:Button;
        private var _cancelBtn:Button;

        public function HotlooksView(k:HabboTabletAvatarEditor, _arg_2:Vector.<Outfit>);

        public function dispose():void;

        public function get view():FeathersControl;

        private function createView():void;

        private function onCancel(k:Event):void;

        private function onCreate(k:Event):void;

        private function productButtonFactory():OutfitButton;

        private function onListSelectionChange(k:Event):void;

        private function calloutClubPromo(k:DisplayObject):void;

        private function onGetClubBtn(k:Event):void;

        private function calloutText(k:DisplayObject, _arg_2:String):void;


    }
}//package com.sulake.habbo.avatareditor.view

