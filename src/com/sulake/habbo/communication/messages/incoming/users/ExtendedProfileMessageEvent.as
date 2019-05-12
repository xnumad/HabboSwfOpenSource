package com.sulake.habbo.communication.messages.incoming.users
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.users.ExtendedProfileMessageParser;

    public class ExtendedProfileMessageEvent extends MessageEvent implements IMessageEvent 
    {
        public function ExtendedProfileMessageEvent(k:Function)
        {
            super(k, ExtendedProfileMessageParser);
        }

        public function get data():ExtendedProfileData
        {
            return ExtendedProfileMessageParser(_parser).data;
        }
    }
}
