//com.sulake.habbo.communication.messages.incoming.users.RelationshipStatusInfoEvent

package com.sulake.habbo.communication.messages.incoming.users{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.core.utils.Map;

    [SecureSWF(rename="true")]
    public class RelationshipStatusInfoEvent extends MessageEvent implements IMessageEvent {

        public function RelationshipStatusInfoEvent(k:Function);

        public function get userId():int;

        public function get relationshipStatusMap():Map;


    }
}//package com.sulake.habbo.communication.messages.incoming.users

