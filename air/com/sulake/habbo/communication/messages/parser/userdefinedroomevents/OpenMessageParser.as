//com.sulake.habbo.communication.messages.parser.userdefinedroomevents.OpenMessageParser

package com.sulake.habbo.communication.messages.parser.userdefinedroomevents{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class OpenMessageParser implements IMessageParser {

        private var _stuffId:int;

        public function OpenMessageParser();

        public function flush():Boolean;

        public function parse(k:IMessageDataWrapper):Boolean;

        public function get stuffId():int;


    }
}//package com.sulake.habbo.communication.messages.parser.userdefinedroomevents

