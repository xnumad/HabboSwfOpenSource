//com.sulake.habbo.communication.messages.parser.tracking.LatencyPingResponseMessageParser

package com.sulake.habbo.communication.messages.parser.tracking{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class LatencyPingResponseMessageParser implements IMessageParser {

        private var _requestId:int;

        public function LatencyPingResponseMessageParser();

        public function get requestId():int;

        public function flush():Boolean;

        public function parse(k:IMessageDataWrapper):Boolean;


    }
}//package com.sulake.habbo.communication.messages.parser.tracking

