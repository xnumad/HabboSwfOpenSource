//com.sulake.habbo.communication.messages.parser.friendlist.MessengerInitMessageParser

package com.sulake.habbo.communication.messages.parser.friendlist{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class MessengerInitMessageParser implements IMessageParser {

        private var _userFriendLimit:int;
        private var _normalFriendLimit:int;
        private var _extendedFriendLimit:int;
        private var _evenMoreExtendedFriendLimit:int;
        private var _categories:Array;
        private var _friends:Array;

        public function MessengerInitMessageParser();

        public function flush():Boolean;

        public function parse(k:IMessageDataWrapper):Boolean;

        public function get userFriendLimit():int;

        public function get normalFriendLimit():int;

        public function get extendedFriendLimit():int;

        public function get categories():Array;

        public function get friends():Array;

        public function get evenMoreExtendedFriendLimit():int;


    }
}//package com.sulake.habbo.communication.messages.parser.friendlist

