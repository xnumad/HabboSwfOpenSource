//com.sulake.habbo.communication.messages.incoming.friendlist.FriendRequestData

package com.sulake.habbo.communication.messages.incoming.friendlist{
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class FriendRequestData {

        private var _requestId:int;
        private var _requesterName:String;
        private var _requesterUserId:int;
        private var _figureString:String;

        public function FriendRequestData(k:IMessageDataWrapper);

        public function get requestId():int;

        public function get requesterName():String;

        public function get requesterUserId():int;

        public function get figureString():String;


    }
}//package com.sulake.habbo.communication.messages.incoming.friendlist

