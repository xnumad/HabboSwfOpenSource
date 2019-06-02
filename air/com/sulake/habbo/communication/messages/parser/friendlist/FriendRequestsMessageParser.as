//com.sulake.habbo.communication.messages.parser.friendlist.FriendRequestsMessageParser

package com.sulake.habbo.communication.messages.parser.friendlist{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class FriendRequestsMessageParser implements IMessageParser {

        private var _totalReqCount:int;
        private var _reqs:Array;

        public function FriendRequestsMessageParser();

        public function flush():Boolean;

        public function parse(k:IMessageDataWrapper):Boolean;

        public function get totalReqCount():int;

        public function get reqs():Array;


    }
}//package com.sulake.habbo.communication.messages.parser.friendlist

