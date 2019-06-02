//com.sulake.habbo.toolbar.ToolbarItem

package com.sulake.habbo.toolbar{
    import starling.textures.Texture;
    import feathers.controls.LayoutGroup;
    import feathers.controls.ImageLoader;
    import starling.animation.Tween;

    public class ToolbarItem {

        protected var _id:String;
        protected var _texture:Texture;
        protected var _listener:Function;
        protected var _view:LayoutGroup;
        protected var _notificationIconTexName:String;
        protected var _notification:ImageLoader;
        private var _notificationTween:Tween;

        public function ToolbarItem(k:String, _arg_2:Texture, _arg_3:String, _arg_4:Function);

        public function dispose():void;

        public function get view():LayoutGroup;

        public function get id():String;

        public function showNotification(k:Boolean):void;

        protected function createView():void;


    }
}//package com.sulake.habbo.toolbar

