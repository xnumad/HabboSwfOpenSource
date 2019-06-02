//com.sulake.habbo.localimage.LocalImageLoader

package com.sulake.habbo.localimage{
    import feathers.controls.LayoutGroup;
    import feathers.controls.ImageLoader;
    import com.sulake.core.utils.IFileProxy;
    import starling.events.Event;

    public class LocalImageLoader extends LayoutGroup {

        private var _fileName:String;
        private var _bgImg:ImageLoader;

        public function LocalImageLoader(k:String);

        private static function get fileProxy():IFileProxy;


        override public function dispose():void;

        override public function set visible(k:Boolean):void;

        private function onAddedToStage(k:Event):void;

        private function onRemovedFromStage(k:Event):void;

        private function addImage():void;

        private function removeImage():void;


    }
}//package com.sulake.habbo.localimage

