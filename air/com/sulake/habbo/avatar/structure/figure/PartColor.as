//com.sulake.habbo.avatar.structure.figure.PartColor

package com.sulake.habbo.avatar.structure.figure{
    import flash.geom.ColorTransform;

    public class PartColor implements IPartColor {

        private var _id:int;
        private var _index:int;
        private var _clubLevel:int;
        private var _isSelectable:Boolean;
        private var _rgb:uint;
        private var _r:uint;
        private var _g:uint;
        private var _b:uint;
        private var _redMultiplier:Number;
        private var _greenMultiplier:Number;
        private var _blueMultiplier:Number;
        private var _colorTransform:ColorTransform;

        public function PartColor(k:XML);

        public function get colorTransform():ColorTransform;

        public function get redMultiplier():Number;

        public function get greenMultiplier():Number;

        public function get blueMultiplier():Number;

        public function get rgb():uint;

        public function get r():uint;

        public function get g():uint;

        public function get b():uint;

        public function get id():int;

        public function get index():int;

        public function get clubLevel():int;

        public function get isSelectable():Boolean;


    }
}//package com.sulake.habbo.avatar.structure.figure

