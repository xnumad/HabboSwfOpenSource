package com.sulake.habbo.communication.messages.parser.room.action
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class _Str_7555 implements IMessageParser 
    {
        private var _userId:int = 0;
        private var _Str_21645:Boolean = false;


        public function get userId():int
        {
            return this._userId;
        }

        public function get _Str_25565():Boolean
        {
            return this._Str_21645;
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
            this._Str_21645 = k.readBoolean();
            return true;
        }
    }
}
