//com.sulake.habbo.avatareditor.EffectsController

package com.sulake.habbo.avatareditor{
    import com.sulake.core.runtime.IDisposable;
    import __AS3__.vec.Vector;
    import com.sulake.habbo.avatareditor.view.Effect;
    import com.sulake.habbo.avatareditor.view.EffectsView;

    public class EffectsController implements IDisposable {

        private static const FILTER_NONE:int;
        private static const FILTER_INCLUDE_INACTIVE:int;
        private static const FILTER_INCLUDE_ACTIVE:int;

        private var _effects:Vector.<Effect>;
        private var _lastActivatedEffect:int;
        private var _avatarEditor:HabboTabletAvatarEditor;
        private var _isDisposed:Boolean;
        private var _view:EffectsView;

        public function EffectsController(k:HabboTabletAvatarEditor);

        public function dispose():void;

        public function get disposed():Boolean;

        private function getEffect(k:int):Effect;

        public function addEffect(k:Effect, _arg_2:Boolean=true):void;

        private function removeEffect(k:int):void;

        private function requestEffectActivated(k:int):void;

        public function setEffectActivated(k:int):void;

        public function useEffect(k:int):void;

        public function stopUsingEffect(k:int, _arg_2:Boolean=false):void;

        public function stopUsingAllEffects(k:Boolean=true, _arg_2:Boolean=true, _arg_3:Boolean=false):void;

        public function toggleEffectSelected(k:int):void;

        public function setEffectSelected(k:int):void;

        public function setEffectDeselected(k:int):void;

        private function setAllEffectsDeselected(k:Boolean=true):void;

        public function getSelectedEffect(k:int=-1):Effect;

        public function getEffects(k:int=-1):Vector.<Effect>;

        public function setEffectExpired(k:int):void;

        public function show():void;

        public function get avatarEditor():HabboTabletAvatarEditor;

        public function reactivateLastEffect():void;


    }
}//package com.sulake.habbo.avatareditor

