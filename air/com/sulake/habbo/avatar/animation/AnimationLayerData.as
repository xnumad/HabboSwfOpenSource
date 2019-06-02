//com.sulake.habbo.avatar.animation.AnimationLayerData

package com.sulake.habbo.avatar.animation{
    import com.sulake.habbo.avatar.actions.IActiveActionData;
    import flash.utils.Dictionary;
    import com.sulake.habbo.avatar.actions.IActionDefinition;

    public class AnimationLayerData implements IAnimationLayerData {

        public static const TYPE_BODYPART:String;
        public static const TYPE_FX:String;

        private var _id:String;
        private var _action:IActiveActionData;
        private var _animationFrame:int;
        private var _dx:int;
        private var _dy:int;
        private var _dz:int;
        private var _directionOffset:int;
        private var _type:String;
        private var _base:String;
        private var _items:Dictionary;

        public function AnimationLayerData(k:XML, _arg_2:String, _arg_3:IActionDefinition);

        public function get items():Dictionary;

        public function get id():String;

        public function get animationFrame():int;

        public function get dx():int;

        public function get dy():int;

        public function get dz():int;

        public function get directionOffset():int;

        public function get type():String;

        public function get base():String;

        public function get action():IActiveActionData;


    }
}//package com.sulake.habbo.avatar.animation

