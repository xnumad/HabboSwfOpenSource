//com.sulake.habbo.communication.messages.incoming.nux.NewUserExperienceNotCompleteEvent

package com.sulake.habbo.communication.messages.incoming.nux{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.nux.NewUserExperienceNotCompleteParser;

    [SecureSWF(rename="true")]
    public class NewUserExperienceNotCompleteEvent extends MessageEvent implements IMessageEvent {

        public function NewUserExperienceNotCompleteEvent(k:Function);

        public function getParser():NewUserExperienceNotCompleteParser;


    }
}//package com.sulake.habbo.communication.messages.incoming.nux

