//com.sulake.habbo.actionModeSelector.ActionModeSelector

package com.sulake.habbo.actionModeSelector{
    import com.sulake.habbo.session.IRoomSession;
    import com.sulake.habbo.room.IRoomEngine;
    import feathers.controls.LayoutGroup;
    import feathers.controls.ImageLoader;
    import starling.animation.Tween;
    import feathers.core.FeathersControl;
    import starling.events.TouchEvent;

    public class ActionModeSelector {

        private var _roomSession:IRoomSession;
        private var _roomEngine:IRoomEngine;
        private var _view:LayoutGroup;
        private var _button:ImageLoader;
        private var _tween:Tween;

        public function ActionModeSelector(k:IRoomSession, _arg_2:IRoomEngine);

        public function dispose():void;

        public function get view():FeathersControl;

        private function createView():void;

        private function onTouch(k:TouchEvent):void;

        private function toggle():void;

        private function update(k:Boolean=false):void;


    }
}//package com.sulake.habbo.actionModeSelector

