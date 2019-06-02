//com.sulake.habbo.avatar.animation.Animation

package com.sulake.habbo.avatar.animation{
    import __AS3__.vec.Vector;
    import com.sulake.core.utils.Map;
    import com.sulake.habbo.avatar.AvatarStructure;

    public class Animation implements IAnimation {

        private static const HELPER_IDS_ARR:Array;

        private var _id:String;
        private var _description:String;
        private var _frames:Array;
        private var _spriteData:Vector.<ISpriteDataContainer>;
        private var _avatarData:AvatarDataContainer;
        private var _directionData:DirectionDataContainer;
        private var _removeData:Array;
        private var _addData:Array;
        private var _overriddenActions:Map;
        private var _overrideFrames:Map;
        private var _resetOnToggle:Boolean;

        public function Animation(k:AvatarStructure, _arg_2:XML);

        private function parseFrames(k:Array, _arg_2:XMLList, _arg_3:AvatarStructure):void;

        public function frameCount(k:String=null):int;

        public function hasOverriddenActions():Boolean;

        public function overriddenActionNames():Array;

        public function overridingAction(k:String):String;

        private function getFrames(k:int, _arg_2:String=null):Array;

        public function getAnimatedBodyPartIds(k:int, _arg_2:String=null):Array;

        public function getLayerData(k:int, _arg_2:String, _arg_3:String=null):AnimationLayerData;

        public function hasAvatarData():Boolean;

        public function hasDirectionData():Boolean;

        public function hasAddData():Boolean;

        public function getAddData(k:String):AddDataContainer;

        public function get id():String;

        public function get spriteData():Vector.<ISpriteDataContainer>;

        public function get avatarData():AvatarDataContainer;

        public function get directionData():DirectionDataContainer;

        public function get removeData():Array;

        public function get addData():Array;

        public function toString():String;

        public function get resetOnToggle():Boolean;


    }
}//package com.sulake.habbo.avatar.animation

