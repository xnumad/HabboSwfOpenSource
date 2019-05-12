package com.sulake.habbo.communication.messages.parser.room.action
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class _Str_6731 implements IMessageParser 
    {
        private var _userId:int = 0;
        private var _Str_4384:int = 0;


        public function get userId():int
        {
            return this._userId;
        }

        public function get _Str_8263():int
        {
            return this._Str_4384;
        }

        public function flush():Boolean
        {
            this._userId = 0;
            return true;
        }

        public function parse(k:IMessageDataWrapper):Boolean
        {
            if (k == null)
            {
                return false;
            }
            this._userId = k.readInteger();
            this._Str_4384 = k.readInteger();
            return true;
        }
    }
}
