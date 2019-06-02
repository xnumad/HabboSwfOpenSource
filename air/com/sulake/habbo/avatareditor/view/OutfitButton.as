//com.sulake.habbo.avatareditor.view.OutfitButton

package com.sulake.habbo.avatareditor.view{
    import feathers.controls.renderers.LayoutGroupListItemRenderer;
    import feathers.controls.renderers.IListItemRenderer;
    import com.sulake.habbo.avatar.IAvatarImageListener;
    import feathers.controls.Button;
    import feathers.controls.ImageLoader;
    import com.sulake.habbo.avatar.IAvatarRenderManager;
    import com.sulake.feathers.controls.RotatingRays;
    import com.sulake.core.utils.IFileProxy;
    import starling.events.Event;

    public class OutfitButton extends LayoutGroupListItemRenderer implements IListItemRenderer, IAvatarImageListener {

        private var _button:Button;
        private var _image:ImageLoader;
        private var _clubImage:ImageLoader;
        private var _avatarRenderManager:IAvatarRenderManager;
        private var _avatarBackground:RotatingRays;

        public function OutfitButton(k:IAvatarRenderManager);

        private static function get fileProxy():IFileProxy;


        override public function dispose():void;

        override protected function initialize():void;

        private function onTriggered(k:Event):void;

        override protected function draw():void;

        override protected function commitData():void;

        private function onChanged(k:Event):void;

        private function renderData():void;

        private function updateThumb(k:String):void;

        override public function set isSelected(k:Boolean):void;

        public function avatarImageReady(k:String):void;

        public function get disposed():Boolean;


    }
}//package com.sulake.habbo.avatareditor.view

