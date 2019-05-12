package com.sulake.habbo.communication.messages.parser.quest
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class ConcurrentUsersGoalProgressParser implements IMessageParser 
    {
        private var _state:int;
        private var _userCount:int;
        private var _Str_5422:int;


        public function flush():Boolean
        {
            this._state = -1;
            this._userCount = -1;
            this._Str_5422 = -1;
            return true;
        }

        public function parse(k:IMessageDataWrapper):Boolean
        {
            this._state = k.readInteger();
            this._userCount = k.readInteger();
            this._Str_5422 = k.readInteger();
            return true;
        }

        public function get state():int
        {
            return this._state;
        }

        public function get userCount():int
        {
            return this._userCount;
        }

        public function get _Str_21827():int
        {
            return this._Str_5422;
        }
    }
}
