//com.sulake.habbo.communication.messages.incoming.quest.ConcurrentUsersGoalProgressMessageEvent

package com.sulake.habbo.communication.messages.incoming.quest{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.quest.ConcurrentUsersGoalProgressMessageParser;

    [SecureSWF(rename="true")]
    public class ConcurrentUsersGoalProgressMessageEvent extends MessageEvent implements IMessageEvent {

        public function ConcurrentUsersGoalProgressMessageEvent(k:Function);

        public function getParser():ConcurrentUsersGoalProgressMessageParser;


    }
}//package com.sulake.habbo.communication.messages.incoming.quest

