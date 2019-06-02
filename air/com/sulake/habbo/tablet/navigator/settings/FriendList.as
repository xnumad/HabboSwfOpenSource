//com.sulake.habbo.tablet.navigator.settings.FriendList

package com.sulake.habbo.tablet.navigator.settings{
    import flash.utils.Dictionary;
    import com.sulake.core.communication.messages.IMessageEvent;

    public class FriendList {

        private var _namesById:Dictionary;
        private var _list:Array;

        public function FriendList();

        public function onMessengerInit(k:IMessageEvent):void;

        public function onFriendListUpdate(k:IMessageEvent):void;

        public function get list():Array;


    }
}//package com.sulake.habbo.tablet.navigator.settings

