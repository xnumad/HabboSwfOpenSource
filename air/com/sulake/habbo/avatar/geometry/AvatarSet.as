//com.sulake.habbo.avatar.geometry.AvatarSet

package com.sulake.habbo.avatar.geometry{
    import flash.utils.Dictionary;

    public class AvatarSet {

        private var _id:String;
        private var _avatarSets:Dictionary;
        private var _bodyParts:Array;
        private var _allBodyParts:Array;
        private var _isMain:Boolean;

        public function AvatarSet(k:XML);

        public function findAvatarSet(k:String):AvatarSet;

        public function getBodyParts():Array;

        public function get id():String;

        public function get isMain():Boolean;


    }
}//package com.sulake.habbo.avatar.geometry

