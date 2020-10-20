package com.sulake.habbo.communication.messages.parser.help
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class GuideTicketResolutionMessageParser implements IMessageParser
    {
        private static const _Str_17022:int = 0;
        private static const _Str_16537:int = 1;
        private static const _Str_22033:int = 2;

        private var _resolution:int = -1;


        public function flush():Boolean
        {
            this._resolution = -1;
            return true;
        }

        public function parse(k:IMessageDataWrapper):Boolean
        {
            this._resolution = k.readInteger();
            return true;
        }

        public function get localizationCode():String
        {
            if (((this._resolution == _Str_17022) || (this._resolution == _Str_16537)))
            {
                return "valid";
            }
            return "invalid";
        }
    }
}
