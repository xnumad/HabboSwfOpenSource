//com.sulake.habbo.communication.messages.parser.friendlist.FindFriendsProcessResultMessageParser

package com.sulake.habbo.communication.messages.parser.friendlist{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class FindFriendsProcessResultMessageParser implements IMessageParser {

        private var _success:Boolean;

        public function FindFriendsProcessResultMessageParser();

        public function get success():Boolean;

        public function flush():Boolean;

        public function parse(k:IMessageDataWrapper):Boolean;


    }
}//package com.sulake.habbo.communication.messages.parser.friendlist

