package com.sulake.habbo.communication.messages.incoming.nux
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.nux.NewUserExperienceNotCompleteParser;

    public class NewUserExperienceNotCompleteEvent extends MessageEvent implements IMessageEvent
    {
        public function NewUserExperienceNotCompleteEvent(k:Function)
        {
            super(k, NewUserExperienceNotCompleteParser);
        }

        public function getParser():NewUserExperienceNotCompleteParser
        {
            return _parser as NewUserExperienceNotCompleteParser;
        }
    }
}
