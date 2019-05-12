package com.sulake.habbo.communication.messages.parser.room.chat
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class _Str_8185 implements IMessageParser 
    {
        private var _userId:int = 0;
        private var _Str_3362:Boolean = false;


        public function get userId():int
        {
            return this._userId;
        }

        public function get _Str_7319():Boolean
        {
            return this._Str_3362;
        }

        public function flush():Boolean
        {
            this._userId = 0;
            this._Str_3362 = false;
            return true;
        }

        public function parse(k:IMessageDataWrapper):Boolean
        {
            if (k == null)
            {
                return false;
            }
            this._userId = k.readInteger();
            this._Str_3362 = (k.readInteger() == 1);
            return true;
        }
    }
}
