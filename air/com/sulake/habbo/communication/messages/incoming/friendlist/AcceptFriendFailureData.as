//com.sulake.habbo.communication.messages.incoming.friendlist.AcceptFriendFailureData

package com.sulake.habbo.communication.messages.incoming.friendlist{
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class AcceptFriendFailureData {

        private var _senderId:int;
        private var _errorCode:int;

        public function AcceptFriendFailureData(k:IMessageDataWrapper);

        public function get senderId():int;

        public function get errorCode():int;


    }
}//package com.sulake.habbo.communication.messages.incoming.friendlist

