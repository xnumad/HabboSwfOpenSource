package com.sulake.habbo.communication.messages.incoming.users
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.users.RelationshipStatusInfoMessageParser;
    import com.sulake.core.utils.Map;

    public class RelationshipStatusInfoEvent extends MessageEvent implements IMessageEvent
    {
        public function RelationshipStatusInfoEvent(k:Function)
        {
            super(k, RelationshipStatusInfoMessageParser);
        }

        public function get userId():int
        {
            return (_parser as RelationshipStatusInfoMessageParser).userId;
        }

        public function get relationshipStatusMap():Map
        {
            return (_parser as RelationshipStatusInfoMessageParser).relationshipStatusMap;
        }
    }
}
