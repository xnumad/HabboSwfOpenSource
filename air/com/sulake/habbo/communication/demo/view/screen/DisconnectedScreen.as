//com.sulake.habbo.communication.demo.view.screen.DisconnectedScreen

package com.sulake.habbo.communication.demo.view.screen{
    import feathers.controls.LayoutGroup;
    import com.sulake.habbo.communication.demo.HabboCommunicationDemo;
    import feathers.controls.Label;
    import feathers.controls.ImageLoader;
    import com.sulake.core.utils.IFileProxy;
    import starling.events.Event;

    public class DisconnectedScreen extends LayoutGroup implements ILoginScreen {

        private var _controller:HabboCommunicationDemo;
        private var _reason:int;
        private var _reasonName:String;
        private var _reasonLabel:Label;
        private var _reasonIdLabel:Label;
        private var _initialized:Boolean;
        private var _image:ImageLoader;
        private var _key:String;

        public function DisconnectedScreen(k:HabboCommunicationDemo);

        private static function get fileProxy():IFileProxy;


        override public function dispose():void;

        private function initializeHandler(k:Event):void;

        public function setReason(k:int, _arg_2:String):void;

        public function updateLocalizations():void;

        private function updateImage():void;

        private function reboot(k:Event):void;

        private function onImageRemovedFromStage(k:Event):void;


    }
}//package com.sulake.habbo.communication.demo.view.screen

