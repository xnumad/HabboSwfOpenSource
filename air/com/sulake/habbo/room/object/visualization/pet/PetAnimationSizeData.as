//com.sulake.habbo.room.object.visualization.pet.PetAnimationSizeData

package com.sulake.habbo.room.object.visualization.pet{
    import com.sulake.habbo.room.object.visualization.data.AnimationSizeData;
    import com.sulake.core.utils.Map;

    public class PetAnimationSizeData extends AnimationSizeData {

        public static const ANIMATION_NOT_DEFINED_ID:int;

        private var _posturesToAnimations:Map;
        private var _gesturesToAnimations:Map;
        private var _defaultPosture:String;

        public function PetAnimationSizeData(k:int, _arg_2:int);

        public function definePostures(k:XML):Boolean;

        public function defineGestures(k:XML):Boolean;

        public function getAnimationForPosture(k:String):int;

        public function getGestureDisabled(k:String):Boolean;

        public function getAnimationForGesture(k:String):int;

        public function getPostureForAnimation(k:int):String;

        public function getGestureForAnimation(k:int):String;

        public function getPostureCount():int;

        public function getGestureCount():int;


    }
}//package com.sulake.habbo.room.object.visualization.pet

