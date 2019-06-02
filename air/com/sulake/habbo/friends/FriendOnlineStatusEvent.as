//com.sulake.habbo.friends.FriendOnlineStatusEvent

package com.sulake.habbo.friends{
    import flash.events.Event;

    public class FriendOnlineStatusEvent extends Event {

        public static const STATUS_CHANGED:String;

        private var _friendId:int;
        private var _isOnline:Boolean;

        public function FriendOnlineStatusEvent(k:int, _arg_2:Boolean, _arg_3:Boolean=false, _arg_4:Boolean=false);

        public function get friendId():int;

        public function get isOnline():Boolean;


    }
}//package com.sulake.habbo.friends

