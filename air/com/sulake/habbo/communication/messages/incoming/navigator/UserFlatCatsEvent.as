//com.sulake.habbo.communication.messages.incoming.navigator.UserFlatCatsEvent

package com.sulake.habbo.communication.messages.incoming.navigator{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.navigator.UserFlatCatsMessageParser;

    [SecureSWF(rename="true")]
    public class UserFlatCatsEvent extends MessageEvent implements IMessageEvent {

        public function UserFlatCatsEvent(k:Function);

        public function getParser():UserFlatCatsMessageParser;


    }
}//package com.sulake.habbo.communication.messages.incoming.navigator

