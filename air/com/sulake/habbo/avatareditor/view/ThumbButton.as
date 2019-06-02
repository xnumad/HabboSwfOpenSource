//com.sulake.habbo.avatareditor.view.ThumbButton

package com.sulake.habbo.avatareditor.view{
    import feathers.controls.renderers.LayoutGroupListItemRenderer;
    import feathers.controls.renderers.IListItemRenderer;
    import com.sulake.habbo.avatar.IAvatarImageListener;
    import feathers.controls.Button;
    import feathers.controls.ImageLoader;
    import com.sulake.habbo.avatareditor.HabboTabletAvatarEditor;
    import starling.events.Event;

    public class ThumbButton extends LayoutGroupListItemRenderer implements IListItemRenderer, IAvatarImageListener {

        private var _button:Button;
        private var _image:ImageLoader;
        private var _clubImage:ImageLoader;
        private var _avatarEditor:HabboTabletAvatarEditor;

        public function ThumbButton(k:HabboTabletAvatarEditor);

        override public function dispose():void;

        override protected function initialize():void;

        private function onTriggered(k:Event):void;

        override protected function draw():void;

        override protected function commitData():void;

        private function updateThumb(k:String):void;

        public function avatarImageReady(k:String):void;

        override public function set isSelected(k:Boolean):void;

        public function get disposed():Boolean;

        public function updateColors(k:Array):void;


    }
}//package com.sulake.habbo.avatareditor.view

