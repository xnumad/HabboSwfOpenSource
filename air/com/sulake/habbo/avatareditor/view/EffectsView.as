//com.sulake.habbo.avatareditor.view.EffectsView

package com.sulake.habbo.avatareditor.view{
    import com.sulake.habbo.avatareditor.EffectsController;
    import feathers.controls.LayoutGroup;
    import feathers.data.ListCollection;
    import feathers.controls.List;
    import feathers.controls.Button;
    import feathers.controls.Label;
    import __AS3__.vec.Vector;
    import feathers.core.FeathersControl;
    import starling.events.Event;

    public class EffectsView {

        private static const BUTTON_DIMENSION:int;

        private var _context:EffectsController;
        private var _view:LayoutGroup;
        private var _layouts:ListCollection;
        private var _list:List;
        private var _activateButton:Button;
        private var _cancelBtn:Button;
        private var _informationLabel:Label;
        private var _effectTitle:Label;
        private var _effectDescription:Label;
        private var _deActivateButton:Button;
        private var _effectInformationGroup:LayoutGroup;

        public function EffectsView(k:EffectsController, _arg_2:Vector.<Effect>);

        public function dispose():void;

        public function get view():FeathersControl;

        private function createView():void;

        private function createInformationGroups():LayoutGroup;

        private function createButtonsGroup():LayoutGroup;

        private function onCancel(k:Event):void;

        private function onActivate(k:Event):void;

        private function onDeActivate(k:Event):void;

        private function productButtonFactory():EffectButton;

        private function onListSelectionChange(k:Event):void;

        public function update(k:Vector.<Effect>):void;


    }
}//package com.sulake.habbo.avatareditor.view

