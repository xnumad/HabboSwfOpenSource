//com.sulake.habbo.furni.stickie.EditView

package com.sulake.habbo.furni.stickie{
    import feathers.controls.LayoutGroup;
    import feathers.controls.TextInput;
    import feathers.controls.Button;
    import starling.display.Quad;
    import starling.events.Event;
    import starling.events.TouchEvent;

    public class EditView extends LayoutGroup {

        private static const TEXT_HEIGHT:int;
        private static const TEXT_WIDTH:int;

        private var _stickie:StickieCtrl;
        private var _input:TextInput;
        private var _saveBtn:Button;
        private var _cancelBtn:Button;
        private var _activeBg:Quad;

        public function EditView(k:StickieCtrl);

        override public function dispose():void;

        public function show():void;

        private function delayedFocusCall(k:Event=null):void;

        public function get text():String;

        public function getActiveBg():Quad;

        private function onBgTouch(k:TouchEvent):void;

        private function onCancel(k:Event):void;

        private function onSave(k:Event):void;


    }
}//package com.sulake.habbo.furni.stickie

