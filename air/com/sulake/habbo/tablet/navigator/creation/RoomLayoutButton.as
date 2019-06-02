//com.sulake.habbo.tablet.navigator.creation.RoomLayoutButton

package com.sulake.habbo.tablet.navigator.creation{
    import feathers.controls.renderers.LayoutGroupListItemRenderer;
    import feathers.controls.renderers.IListItemRenderer;
    import feathers.controls.Button;
    import feathers.controls.Label;
    import feathers.controls.ImageLoader;
    import com.sulake.core.utils.IFileProxy;
    import starling.events.Event;

    public class RoomLayoutButton extends LayoutGroupListItemRenderer implements IListItemRenderer {

        private var _button:Button;
        private var _tileLabel:Label;
        private var _image:ImageLoader;
        private var _clubImage:ImageLoader;

        public function RoomLayoutButton();

        private static function get fileProxy():IFileProxy;


        override public function dispose():void;

        override protected function initialize():void;

        private function onTriggered(k:Event):void;

        override protected function draw():void;

        override protected function commitData():void;

        override public function set isSelected(k:Boolean):void;


    }
}//package com.sulake.habbo.tablet.navigator.creation

