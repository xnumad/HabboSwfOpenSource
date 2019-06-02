//com.sulake.habbo.profile.avatar.slot.AvatarImageSlot

package com.sulake.habbo.profile.avatar.slot{
    import com.sulake.habbo.avatar.IAvatarImageListener;
    import feathers.controls.LayoutGroup;
    import feathers.controls.ImageLoader;
    import starling.textures.Texture;
    import com.sulake.habbo.avatar.IAvatarRenderManager;

    public class AvatarImageSlot implements IAvatarImageListener {

        private var _view:LayoutGroup;
        private var _image:ImageLoader;
        private var _texture:Texture;
        private var _renderManager:IAvatarRenderManager;
        private var _figure:String;
        private var _disposed:Boolean;
        private var _centerLayout:Boolean;
        private var _direction:int;

        public function AvatarImageSlot(k:IAvatarRenderManager, _arg_2:Boolean=false);

        public function get disposed():Boolean;

        public function dispose():void;

        public function get view():LayoutGroup;

        public function set direction(k:int):void;

        public function updateImage(k:String, _arg_2:Boolean=false):void;

        private function onStartAlphaTween():void;

        public function avatarImageReady(k:String):void;


    }
}//package com.sulake.habbo.profile.avatar.slot

