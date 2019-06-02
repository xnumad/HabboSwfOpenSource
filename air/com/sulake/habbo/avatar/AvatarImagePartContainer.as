//com.sulake.habbo.avatar.AvatarImagePartContainer

package com.sulake.habbo.avatar{
    import com.sulake.habbo.avatar.structure.figure.IPartColor;
    import com.sulake.habbo.avatar.actions.IActionDefinition;
    import flash.geom.ColorTransform;
    import com.sulake.habbo.avatar.structure.animation.AnimationFrame;

    public class AvatarImagePartContainer {

        private var _bodyPartId:String;
        private var _partType:String;
        private var _flippedPartType:String;
        private var _partId:String;
        private var _color:IPartColor;
        private var _frames:Array;
        private var _framesLen:int;
        private var _action:IActionDefinition;
        private var _isColorable:Boolean;
        private var _isBlendable:Boolean;
        private var _blendTransform:ColorTransform;
        private var _paletteMapId:int;

        public function AvatarImagePartContainer(k:String, _arg_2:String, _arg_3:String, _arg_4:IPartColor, _arg_5:Array, _arg_6:IActionDefinition, _arg_7:Boolean, _arg_8:int, _arg_9:String="", k0:Boolean=false, k1:Number=1);

        public function getFrameIndex(k:int):int;

        public function getAnimationFrame(k:int):AnimationFrame;

        public function getCacheableKey(k:int):String;

        public function get bodyPartId():String;

        public function get partType():String;

        public function get partId():String;

        public function get color():IPartColor;

        public function get action():IActionDefinition;

        public function set isColorable(k:Boolean):void;

        public function get isColorable():Boolean;

        public function get paletteMapId():int;

        public function get flippedPartType():String;

        public function get isBlendable():Boolean;

        public function get blendTransform():ColorTransform;

        public function toString():String;


    }
}//package com.sulake.habbo.avatar

