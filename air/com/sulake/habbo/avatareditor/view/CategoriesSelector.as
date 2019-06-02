//com.sulake.habbo.avatareditor.view.CategoriesSelector

package com.sulake.habbo.avatareditor.view{
    import feathers.controls.LayoutGroup;
    import feathers.controls.TabBar;
    import feathers.data.ListCollection;
    import feathers.controls.Button;
    import starling.events.Event;
    import starling.display.DisplayObject;

    public class CategoriesSelector extends LayoutGroup {

        private var _mainView:MainView;
        private var _mainCategoriesTabs:TabBar;
        private var _subCategories:TabBar;
        private var _mainTabContent:ListCollection;
        private var _wardrobeButton:Button;
        private var _hotlooksButton:Button;
        private var _effectsButton:Button;

        public function CategoriesSelector(k:MainView);

        private function initData():void;

        private function createView():void;

        public function resetGender():void;

        private function onWardrobe(k:Event):void;

        private function onHotlooks(k:Event):void;

        private function onEffects(k:Event):void;

        private function showNoEffectsCallout(k:DisplayObject):void;

        private function onGetEffects(k:Event):void;

        public function update():void;

        private function onSubCategoriesChanged(k:Event=null):void;

        private function onTabBarChanged(k:Event=null):void;

        public function getSetType():String;


    }
}//package com.sulake.habbo.avatareditor.view

