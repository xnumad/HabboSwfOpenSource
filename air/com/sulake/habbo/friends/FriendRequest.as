//com.sulake.habbo.friends.FriendRequest

package com.sulake.habbo.friends{
    import starling.textures.Texture;
    import com.sulake.habbo.communication.messages.incoming.friendlist.FriendRequestData;

    public class FriendRequest {

        public static const STATE_OPEN:int;
        public static const STATE_ACCEPTED:int;
        public static const STATE_DECLINED:int;
        public static const STATE_FAILED:int;
        private static var _icon:Texture;

        private var _requestId:int;
        private var _name:String;
        private var _key:int;
        private var _state:int;
        private var _disposed:Boolean;

        public function FriendRequest(k:FriendRequestData);

        public function get disposed():Boolean;

        public function get requestId():int;

        public function get name():String;

        public function get key():int;

        public function get thumbnail():Texture;

        public function get state():int;

        public function set state(k:int):void;


    }
}//package com.sulake.habbo.friends

