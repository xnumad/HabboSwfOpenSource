//com.sulake.habbo.avatareditor.view.EffectButton

package com.sulake.habbo.avatareditor.view{
    import feathers.controls.renderers.LayoutGroupListItemRenderer;
    import feathers.controls.renderers.IListItemRenderer;
    import feathers.controls.Button;
    import feathers.controls.ImageLoader;
    import com.sulake.habbo.avatar.IAvatarRenderManager;
    import feathers.controls.Label;
    import feathers.controls.LayoutGroup;
    import feathers.controls.ProgressBar;
    import com.sulake.core.utils.IFileProxy;
    import starling.events.Event;

    public class EffectButton extends LayoutGroupListItemRenderer implements IListItemRenderer {

        private static var MARGIN:int;

        private var _button:Button;
        private var _image:ImageLoader;
        private var _isActivatedImage:ImageLoader;
        private var _isInUse:ImageLoader;
        private var _avatarRenderManager:IAvatarRenderManager;
        private var _amountLabel:Label;
        private var _counter:LayoutGroup;
        private var _progressBar:ProgressBar;

        public function EffectButton(k:IAvatarRenderManager);

        private static function get fileProxy():IFileProxy;


        override public function dispose():void;

        override protected function initialize():void;

        private function createAmountSlot(k:int):LayoutGroup;

        private function onTriggered(k:Event):void;

        override protected function draw():void;

        override protected function commitData():void;

        private function onDataChange(k:Event):void;

        private function renderData():void;

        override public function set isSelected(k:Boolean):void;

        public function get disposed():Boolean;


    }
}//package com.sulake.habbo.avatareditor.view

