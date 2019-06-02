//com.sulake.habbo.communication.messages.parser.friendlist.MiniMailUnreadCountMessageParser

package com.sulake.habbo.communication.messages.parser.friendlist{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class MiniMailUnreadCountMessageParser implements IMessageParser {

        private var _unreadMessageCount:int;

        public function MiniMailUnreadCountMessageParser();

        public function flush():Boolean;

        public function parse(k:IMessageDataWrapper):Boolean;

        public function get unreadMessageCount():int;


    }
}//package com.sulake.habbo.communication.messages.parser.friendlist

