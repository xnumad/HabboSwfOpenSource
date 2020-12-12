package com.sulake.habbo.communication.messages.parser.help
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class GuideTicketResolutionMessageParser implements IMessageParser
    {
        private static const RESOLUTION_GUARDIANS_TOOK_ACTION:int = 0;
        private static const RESOLUTION_FORWARDED_TO_MODERATORS:int = 1;
        private static const RESOLUTION_REPORTER_IS_ABUSIVE:int = 2;

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
            if (((this._resolution == RESOLUTION_GUARDIANS_TOOK_ACTION) || (this._resolution == RESOLUTION_FORWARDED_TO_MODERATORS)))
            {
                return "valid";
            }
            return "invalid";
        }
    }
}
