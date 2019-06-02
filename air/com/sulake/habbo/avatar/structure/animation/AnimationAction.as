//com.sulake.habbo.avatar.structure.animation.AnimationAction

package com.sulake.habbo.avatar.structure.animation{
    import flash.geom.Point;
    import flash.utils.Dictionary;
    import com.sulake.core.utils.Map;

    public class AnimationAction {

        public static const DEFAULT_OFFSET:Point;

        private var _id:String;
        private var _actionParts:Dictionary;
        private var _bodyPartOffsets:Map;
        private var _frameCount:int;
        private var _frameIndexes:Array;

        public function AnimationAction(k:XML);

        public function getPart(k:String):AnimationActionPart;

        public function get id():String;

        public function get parts():Dictionary;

        public function get frameCount():int;

        public function getFrameBodyPartOffset(k:int, _arg_2:int, _arg_3:String):Point;


    }
}//package com.sulake.habbo.avatar.structure.animation

