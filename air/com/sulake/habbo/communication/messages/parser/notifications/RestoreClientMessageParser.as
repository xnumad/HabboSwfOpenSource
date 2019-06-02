//com.sulake.habbo.communication.messages.parser.notifications.RestoreClientMessageParser

package com.sulake.habbo.communication.messages.parser.notifications{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class RestoreClientMessageParser implements IMessageParser {

        public function RestoreClientMessageParser();

        public function flush():Boolean;

        public function parse(k:IMessageDataWrapper):Boolean;


    }
}//package com.sulake.habbo.communication.messages.parser.notifications

