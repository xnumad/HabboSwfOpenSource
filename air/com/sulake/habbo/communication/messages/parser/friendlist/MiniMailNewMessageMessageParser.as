//com.sulake.habbo.communication.messages.parser.friendlist.MiniMailNewMessageMessageParser

package com.sulake.habbo.communication.messages.parser.friendlist{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class MiniMailNewMessageMessageParser implements IMessageParser {

        public function MiniMailNewMessageMessageParser();

        public function flush():Boolean;

        public function parse(k:IMessageDataWrapper):Boolean;


    }
}//package com.sulake.habbo.communication.messages.parser.friendlist

