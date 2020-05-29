package com.sulake.habbo.communication.messages.parser.users
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class IgnoredUsersMessageParser implements IMessageParser
    {
        protected var _ignoredUsers:Array = null;

        public function IgnoredUsersMessageParser()
        {
            this._ignoredUsers = [];
        }

        public function flush():Boolean
        {
            return true;
        }

        public function parse(k:IMessageDataWrapper):Boolean
        {
            this._ignoredUsers = [];
            var _local_2:int = k.readInteger();
            var _local_3:int;
            while (_local_3 < _local_2)
            {
                this._ignoredUsers.push(k.readString());
                _local_3++;
            }
            return true;
        }

        public function get ignoredUsers():Array
        {
            return this._ignoredUsers.slice();
        }
    }
}
