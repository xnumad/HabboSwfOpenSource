//com.sulake.habbo.communication.messages.parser.friendlist.FriendListUpdateMessageParser

package com.sulake.habbo.communication.messages.parser.friendlist{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class FriendListUpdateMessageParser implements IMessageParser {

        private var _cats:Array;
        private var _removedFriendIds:Array;
        private var _addedFriends:Array;
        private var _updatedFriends:Array;

        public function FriendListUpdateMessageParser();

        public function flush():Boolean;

        public function parse(k:IMessageDataWrapper):Boolean;

        public function get cats():Array;

        public function get removedFriendIds():Array;

        public function get addedFriends():Array;

        public function get updatedFriends():Array;


    }
}//package com.sulake.habbo.communication.messages.parser.friendlist

