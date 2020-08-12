package com.sulake.habbo.communication.messages.parser.users
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.habbo.communication.messages.incoming.users.MemberData;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class GroupMembershipRequestedMessageParser implements IMessageParser 
    {
        private var _groupId:int;
        private var _requester:MemberData;


        public function flush():Boolean
        {
            this._requester = null;
            return true;
        }

        public function parse(k:IMessageDataWrapper):Boolean
        {
            this._groupId = k.readInteger();
            this._requester = new MemberData(k);
            return true;
        }

        public function get groupId():int
        {
            return this._groupId;
        }

        public function get requester():MemberData
        {
            return this._requester;
        }
    }
}
