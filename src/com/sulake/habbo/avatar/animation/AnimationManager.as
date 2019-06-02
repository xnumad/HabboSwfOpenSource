package com.sulake.habbo.avatar.animation
{
    import flash.utils.Dictionary;
    import com.sulake.habbo.avatar.AvatarStructure;

    public class AnimationManager implements IAnimationManager 
    {
        private var _animations:Dictionary;

        public function AnimationManager()
        {
            this._animations = new Dictionary();
        }

        public function registerAnimation(k:AvatarStructure, _arg_2:XML):Boolean
        {
            var _local_3:String = String(_arg_2.@name);
            this._animations[_local_3] = new Animation(k, _arg_2);
            return true;
        }

        public function getAnimation(k:String):IAnimation
        {
            return this._animations[k];
        }

        public function getLayerData(k:String, _arg_2:int, _arg_3:String):IAnimationLayerData
        {
            var _local_4:Animation = (this._animations[k] as Animation);
            if (_local_4 != null)
            {
                return _local_4.getLayerData(_arg_2, _arg_3);
            }
            return null;
        }

        public function get animations():Dictionary
        {
            return this._animations;
        }
    }
}
