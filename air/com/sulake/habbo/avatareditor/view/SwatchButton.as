//com.sulake.habbo.avatareditor.view.SwatchButton

package com.sulake.habbo.avatareditor.view{
    import feathers.controls.renderers.LayoutGroupListItemRenderer;
    import feathers.controls.renderers.IListItemRenderer;
    import feathers.controls.Button;
    import feathers.controls.ImageLoader;
    import com.sulake.habbo.avatareditor.HabboTabletAvatarEditor;
    import starling.events.Event;

    public class SwatchButton extends LayoutGroupListItemRenderer implements IListItemRenderer {

        private var _button:Button;
        private var _image:ImageLoader;
        private var _clubImage:ImageLoader;
        private var _avatarEditor:HabboTabletAvatarEditor;

        public function SwatchButton(k:HabboTabletAvatarEditor);

        override public function dispose():void;

        override protected function initialize():void;

        private function onTriggered(k:Event):void;

        override protected function draw():void;

        override protected function commitData():void;

        override public function set isSelected(k:Boolean):void;

        public function get disposed():Boolean;


    }
}//package com.sulake.habbo.avatareditor.view

