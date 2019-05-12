package com.sulake.habbo.communication.messages.parser.users
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class UserBadgesMessageParser implements IMessageParser 
    {
        private var _userId:int;
        private var _badges:Array;


        public function flush():Boolean
        {
            this._userId = -1;
            this._badges = [];
            return true;
        }

        public function parse(k:IMessageDataWrapper):Boolean
        {
            var slotId:int;
            var badgeCode:String;
            this._userId = k.readInteger();
            var count:int = k.readInteger();
            var index:int;
            while (index < count)
            {
                slotId = k.readInteger();
                badgeCode = k.readString();
                this._badges.push(badgeCode);
                index++;
            }
            return true;
        }

        public function get badges():Array
        {
            return this._badges;
        }

        public function get userId():int
        {
            return this._userId;
        }
    }
}
