//com.sulake.habbo.tablet.navigator.RoomFilter

package com.sulake.habbo.tablet.navigator{
    import com.sulake.core.communication.messages.IMessageComposer;
    import feathers.controls.ImageLoader;

    public class RoomFilter {

        private var _name:String;
        private var _searchComposer:IMessageComposer;
        private var _isOfficial:Boolean;
        private var _icon:ImageLoader;
        private var _showCreateRoom:Boolean;

        public function RoomFilter(k:String, _arg_2:IMessageComposer, _arg_3:Boolean=false, _arg_4:Boolean=false, _arg_5:String=null);

        public function dispose():void;

        public function get name():String;

        public function get searchComposer():IMessageComposer;

        public function get isOfficial():Boolean;

        public function get defaultIcon():ImageLoader;

        public function get label():String;

        public function get showCreateRoom():Boolean;


    }
}//package com.sulake.habbo.tablet.navigator

