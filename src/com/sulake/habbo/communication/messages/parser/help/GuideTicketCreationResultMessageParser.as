package com.sulake.habbo.communication.messages.parser.help
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class GuideTicketCreationResultMessageParser implements IMessageParser
    {
        private static const CREATION_RESULT_OK:int = 0;
        private static const CREATION_RESULT_UNABLE_TO_REPORT:int = 1;
        private static const CREATION_RESULT_NO_CHATLOG_FOUND:int = 2;
        private static const CREATION_RESULT_BULLY_ALREADY_REPORTED:int = 3;

        private var _result:int = -1;


        public function flush():Boolean
        {
            this._result = -1;
            return true;
        }

        public function parse(k:IMessageDataWrapper):Boolean
        {
            this._result = k.readInteger();
            return true;
        }

        public function get localizationCode():String
        {
            switch (this._result)
            {
                case CREATION_RESULT_OK:
                    return "sent";
                case CREATION_RESULT_UNABLE_TO_REPORT:
                    return "blocked";
                case CREATION_RESULT_NO_CHATLOG_FOUND:
                    return "nochat";
                case CREATION_RESULT_BULLY_ALREADY_REPORTED:
                    return "alreadyreported";
                default:
                    return "invalid";
            }
        }
    }
}
