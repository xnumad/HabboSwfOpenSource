//com.sulake.habbo.avatar.animation.AvatarDataContainer

package com.sulake.habbo.avatar.animation{
    import flash.geom.ColorTransform;
    import com.sulake.core.utils.Map;

    public class AvatarDataContainer implements IAvatarDataContainer {

        private var _ink:int;
        private var _foreGround:uint;
        private var _backGround:uint;
        private var _colorTransform:ColorTransform;
        private var _rgb:uint;
        private var _r:uint;
        private var _g:uint;
        private var _b:uint;
        private var _redMultiplier:Number;
        private var _greenMultiplier:Number;
        private var _blueMultiplier:Number;
        private var _alphaMultiplier:Number;
        private var _colorMap:Map;
        private var _paletteIsGrayscale:Boolean;

        public function AvatarDataContainer(k:XML);

        public function get ink():int;

        public function get colorTransform():ColorTransform;

        public function get reds():Array;

        public function get greens():Array;

        public function get blues():Array;

        public function get alphas():Array;

        public function get paletteIsGrayscale():Boolean;

        private function generatePaletteMapForGrayscale(k:uint, _arg_2:uint):Map;


    }
}//package com.sulake.habbo.avatar.animation

