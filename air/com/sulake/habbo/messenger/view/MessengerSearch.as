//com.sulake.habbo.messenger.view.MessengerSearch

package com.sulake.habbo.messenger.view{
    import com.sulake.habbo.messenger.HabboTabletMessenger;
    import com.sulake.habbo.ui.HabboUI;
    import feathers.controls.TextInput;
    import feathers.core.FeathersControl;
    import starling.events.Event;
    import feathers.controls.Callout;

    public class MessengerSearch {

        private var _messenger:HabboTabletMessenger;
        private var _habboUI:HabboUI;
        private var _searchField:TextInput;

        public function MessengerSearch(k:HabboTabletMessenger, _arg_2:HabboUI);

        public function dispose():void;

        public function get view():FeathersControl;

        private function createView():void;

        private function onSearchFieldEnter(k:Event):void;

        private function calloutFactory():Callout;

        private function onSearchSelected(k:Event):void;


    }
}//package com.sulake.habbo.messenger.view

