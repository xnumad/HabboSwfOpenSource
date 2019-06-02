//com.sulake.habbo.tablet.catalog.HCNeededView

package com.sulake.habbo.tablet.catalog{
    import feathers.controls.LayoutGroup;
    import starling.events.Event;

    public class HCNeededView extends LayoutGroup {

        private var _buttonCallback:Function;

        public function HCNeededView(k:Function=null);

        override public function dispose():void;

        private function onButtonTriggered(k:Event):void;


    }
}//package com.sulake.habbo.tablet.catalog

