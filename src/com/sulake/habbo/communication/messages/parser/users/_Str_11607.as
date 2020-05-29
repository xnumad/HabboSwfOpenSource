package com.sulake.habbo.communication.messages.parser.users
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class _Str_11607 implements IMessageParser 
    {
        protected var _ignoredUsers:Array = null;

        public function _Str_11607()
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

        public function get _Str_16804():Array
        {
            return this._ignoredUsers.slice();
        }
    }
}
