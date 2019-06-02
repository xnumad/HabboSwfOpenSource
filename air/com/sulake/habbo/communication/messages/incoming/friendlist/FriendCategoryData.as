//com.sulake.habbo.communication.messages.incoming.friendlist.FriendCategoryData

package com.sulake.habbo.communication.messages.incoming.friendlist{
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class FriendCategoryData {

        private var _id:int;
        private var _name:String;

        public function FriendCategoryData(k:IMessageDataWrapper);

        public function get id():int;

        public function get name():String;


    }
}//package com.sulake.habbo.communication.messages.incoming.friendlist

