//com.sulake.habbo.communication.messages.parser.notifications.ElementPointerMessageParser

package com.sulake.habbo.communication.messages.parser.notifications{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class ElementPointerMessageParser implements IMessageParser {

        private var _key:String;

        public function ElementPointerMessageParser();

        public function flush():Boolean;

        public function parse(k:IMessageDataWrapper):Boolean;

        public function get key():String;


    }
}//package com.sulake.habbo.communication.messages.parser.notifications

