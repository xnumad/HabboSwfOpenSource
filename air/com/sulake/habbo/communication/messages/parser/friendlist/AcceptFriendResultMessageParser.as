//com.sulake.habbo.communication.messages.parser.friendlist.AcceptFriendResultMessageParser

package com.sulake.habbo.communication.messages.parser.friendlist{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class AcceptFriendResultMessageParser implements IMessageParser {

        private var _failures:Array;

        public function AcceptFriendResultMessageParser();

        public function flush():Boolean;

        public function parse(k:IMessageDataWrapper):Boolean;

        public function get failures():Array;


    }
}//package com.sulake.habbo.communication.messages.parser.friendlist

