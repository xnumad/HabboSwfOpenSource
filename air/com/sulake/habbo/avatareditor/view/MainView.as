//com.sulake.habbo.avatareditor.view.MainView

package com.sulake.habbo.avatareditor.view{
    import com.sulake.habbo.avatareditor.HabboTabletAvatarEditor;
    import feathers.controls.LayoutGroup;
    import feathers.controls.List;
    import com.sulake.feathers.controls.RotatingRays;
    import com.sulake.habbo.profile.avatar.slot.AvatarImageSlot;
    import feathers.controls.Button;
    import feathers.controls.Label;
    import starling.display.DisplayObject;
    import starling.events.Event;
    import com.sulake.habbo.avatar.structure.IFigureData;
    import com.sulake.habbo.avatar.structure.figure.IPartColor;
    import com.sulake.habbo.avatar.structure.figure.IFigurePartSet;

    public class MainView {

        private static const TITLE_TOP:int;
        private static const TABS_TOP:int;
        private static const MIDDLE:int;
        private static const MARGIN:int;
        private static const MAX_COLOR_LAYERS:int;

        private var _editor:HabboTabletAvatarEditor;
        private var _view:LayoutGroup;
        private var _categories:CategoriesSelector;
        private var _thumbsList:List;
        private var _avatarBackground:RotatingRays;
        private var _avatar:AvatarImageSlot;
        private var _primaryColorList:List;
        private var _secondaryColorList:List;
        private var _restoreButton:Button;
        private var _saveButton:Button;
        private var _isInitialized:Boolean;
        private var _titleLabel:Label;
        private var _addToWardrobe:Button;

        public function MainView(k:HabboTabletAvatarEditor);

        public function dispose():void;

        public function get view():DisplayObject;

        public function hasView():Boolean;

        public function createView():void;

        private function onSave(k:Event):void;

        private function calloutClubPromo(k:DisplayObject):void;

        private function onGetClubBtn(k:Event):void;

        private function onAddToWardrobe(k:Event):void;

        private function onRestore(k:Event):void;

        private function onCloseButton(k:Event):void;

        public function showSetContent(k:String):void;

        private function onThumbsChanged(k:Event):void;

        private function selectColour(k:List, _arg_2:Array, _arg_3:int):void;

        private function get figureStructureData():IFigureData;

        private function updatePalettes(k:String):void;

        private function onPrimaryColorChanged(k:Event):void;

        private function onSecondaryColorChanged(k:Event):void;

        private function updateThumbColors():void;

        public function getCurrentColors():Array;

        private function saveColor(k:IPartColor, _arg_2:int):void;

        public function showContent():void;

        private function swatchButtonFactory():SwatchButton;

        private function thumbsButtonFactory():ThumbButton;

        public function showWardrobe():void;

        public function showHotLooks():void;

        public function showEffects():void;

        public function update(k:Boolean=false):void;

        public function get editor():HabboTabletAvatarEditor;

        private function orderPaletteByClub(k:IPartColor, _arg_2:IPartColor):Number;

        private function orderByClubAsc(k:IFigurePartSet, _arg_2:IFigurePartSet):Number;

        private function orderByClubDesc(k:IFigurePartSet, _arg_2:IFigurePartSet):Number;


    }
}//package com.sulake.habbo.avatareditor.view

