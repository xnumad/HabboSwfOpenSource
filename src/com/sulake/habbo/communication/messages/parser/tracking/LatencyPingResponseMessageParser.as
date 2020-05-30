package com.sulake.habbo.communication.messages.parser.tracking
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class LatencyPingResponseMessageParser implements IMessageParser 
    {
        private var _requestId:int;


        public function get requestId():int
        {
            return this._requestId;
        }

        public function flush():Boolean
        {
            this._requestId = -1;
            return true;
        }

        public function parse(k:IMessageDataWrapper):Boolean
        {
            this._requestId = k.readInteger();
            return true;
        }
    }
}
