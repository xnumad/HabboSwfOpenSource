//com.sulake.habbo.communication.messages.parser.friendlist.NewFriendRequestMessageParser

package com.sulake.habbo.communication.messages.parser.friendlist{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.habbo.communication.messages.incoming.friendlist.FriendRequestData;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class NewFriendRequestMessageParser implements IMessageParser {

        private var _req:FriendRequestData;

        public function NewFriendRequestMessageParser();

        public function flush():Boolean;

        public function parse(k:IMessageDataWrapper):Boolean;

        public function get req():FriendRequestData;


    }
}//package com.sulake.habbo.communication.messages.parser.friendlist

