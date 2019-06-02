//com.sulake.habbo.communication.messages.parser.nux.NewUserExperienceNotCompleteParser

package com.sulake.habbo.communication.messages.parser.nux{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class NewUserExperienceNotCompleteParser implements IMessageParser {

        public function NewUserExperienceNotCompleteParser();

        public function flush():Boolean;

        public function parse(k:IMessageDataWrapper):Boolean;


    }
}//package com.sulake.habbo.communication.messages.parser.nux

