//com.sulake.habbo.communication.messages.parser.friendlist.FollowFriendFailedMessageParser

package com.sulake.habbo.communication.messages.parser.friendlist{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class FollowFriendFailedMessageParser implements IMessageParser {

        private var _errorCode:int;

        public function FollowFriendFailedMessageParser();

        public function flush():Boolean;

        public function parse(k:IMessageDataWrapper):Boolean;

        public function get errorCode():int;


    }
}//package com.sulake.habbo.communication.messages.parser.friendlist

