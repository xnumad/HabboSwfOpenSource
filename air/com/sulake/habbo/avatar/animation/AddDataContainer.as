//com.sulake.habbo.avatar.animation.AddDataContainer

package com.sulake.habbo.avatar.animation{
    public class AddDataContainer {

        private var _id:String;
        private var _align:String;
        private var _base:String;
        private var _ink:String;
        private var _blend:Number;

        public function AddDataContainer(k:XML);

        public function get id():String;

        public function get align():String;

        public function get base():String;

        public function get ink():String;

        public function get blend():Number;

        public function get isBlended():Boolean;


    }
}//package com.sulake.habbo.avatar.animation

