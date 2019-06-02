//com.sulake.habbo.communication.messages.parser.error.ErrorReportMessageParser

package com.sulake.habbo.communication.messages.parser.error{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class ErrorReportMessageParser implements IMessageParser {

        private var _errorCode:int;
        private var _messageId:int;
        private var _timestamp:String;

        public function ErrorReportMessageParser();

        public function parse(k:IMessageDataWrapper):Boolean;

        public function flush():Boolean;

        public function get errorCode():int;

        public function get messageId():int;

        public function get timestamp():String;


    }
}//package com.sulake.habbo.communication.messages.parser.error

