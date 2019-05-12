package com.sulake.habbo.communication.messages.parser.room.action
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class _Str_6708 implements IMessageParser 
    {
        private var _userId:int = 0;
        private var _Str_2625:int;


        public function get userId():int
        {
            return this._userId;
        }

        public function get _Str_2887():int
        {
            return this._Str_2625;
        }

        public function flush():Boolean
        {
            this._userId = 0;
            this._Str_2625 = 0;
            return true;
        }

        public function parse(k:IMessageDataWrapper):Boolean
        {
            if (k == null)
            {
                return false;
            }
            this._userId = k.readInteger();
            this._Str_2625 = k.readInteger();
            return true;
        }
    }
}
