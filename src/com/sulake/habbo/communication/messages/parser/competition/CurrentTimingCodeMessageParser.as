package com.sulake.habbo.communication.messages.parser.competition
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class CurrentTimingCodeMessageParser implements IMessageParser
    {
        private var _schedulingStr:String;
        private var _code:String;


        public function flush():Boolean
        {
            return true;
        }

        public function parse(k:IMessageDataWrapper):Boolean
        {
            this._schedulingStr = k.readString();
            this._code = k.readString();
            return true;
        }

        public function get schedulingStr():String
        {
            return this._schedulingStr;
        }

        public function get code():String
        {
            return this._code;
        }
    }
}
