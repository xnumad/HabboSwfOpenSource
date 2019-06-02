//com.sulake.habbo.communication.messages.parser.friendlist.HabboSearchResultMessageParser

package com.sulake.habbo.communication.messages.parser.friendlist{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class HabboSearchResultMessageParser implements IMessageParser {

        private var _friends:Array;
        private var _others:Array;

        public function HabboSearchResultMessageParser();

        public function flush():Boolean;

        public function parse(k:IMessageDataWrapper):Boolean;

        public function get friends():Array;

        public function get others():Array;


    }
}//package com.sulake.habbo.communication.messages.parser.friendlist

