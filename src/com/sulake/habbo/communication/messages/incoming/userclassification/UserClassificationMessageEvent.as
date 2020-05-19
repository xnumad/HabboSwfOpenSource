package com.sulake.habbo.communication.messages.incoming.userclassification
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.habbo.communication.messages.parser.userclassification.UserClassificationMessageParser;

    public class UserClassificationMessageEvent extends MessageEvent 
    {
        public function UserClassificationMessageEvent(k:Function)
        {
            super(k, UserClassificationMessageParser);
        }

        public function getParser():UserClassificationMessageParser
        {
            return _parser as UserClassificationMessageParser;
        }
    }
}
