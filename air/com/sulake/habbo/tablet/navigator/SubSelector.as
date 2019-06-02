//com.sulake.habbo.tablet.navigator.SubSelector

package com.sulake.habbo.tablet.navigator{
    import feathers.controls.LayoutGroup;
    import feathers.controls.PickerList;
    import feathers.controls.TabBar;
    import starling.events.Event;
    import feathers.data.ListCollection;

    public class SubSelector extends LayoutGroup {

        public static const PICKER:int;
        public static const TABS:int;

        private var _picker:PickerList;
        private var _tabs:TabBar;
        private var _activeMode:int;
        private var _isDisposed:Boolean;

        public function SubSelector();

        private function onChange(k:Event):void;

        override public function dispose():void;

        override public function set width(k:Number):void;

        public function set mode(k:int):void;

        public function get selectedItem():Object;

        public function get selectedIndex():int;

        public function set dataProvider(k:ListCollection):void;

        public function set selectedIndex(k:int):void;

        override public function invalidate(k:String="all"):void;


    }
}//package com.sulake.habbo.tablet.navigator

