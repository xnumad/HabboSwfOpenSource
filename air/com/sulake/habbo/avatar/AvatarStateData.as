//com.sulake.habbo.avatar.AvatarStateData

package com.sulake.habbo.avatar{
    public class AvatarStateData implements IAvatarStateData {

        private var _texName:String;
        private var _isFlipped:Boolean;
        private var _texOffX:int;
        private var _texOffY:int;
        private var _isPlaceHolder:Boolean;

        public function AvatarStateData(k:String, _arg_2:Boolean, _arg_3:int, _arg_4:int);

        public function get textureName():String;

        public function get isFlipped():Boolean;

        public function get textureOffsetX():int;

        public function get textureOffsetY():int;

        public function get isPlaceholder():Boolean;

        public function set isPlaceHolder(k:Boolean):void;


    }
}//package com.sulake.habbo.avatar

