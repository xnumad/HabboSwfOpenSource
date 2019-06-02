package com.sulake.habbo.communication.messages.parser.room.action
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class _Str_7571 implements IMessageParser 
    {
        private var _userId:int = 0;
        private var _Str_3770:int = 0;
        private var _Str_11901:int = 0;


        public function get userId():int
        {
            return this._userId;
        }

        public function get _Str_6815():int
        {
            return this._Str_3770;
        }

        public function get delayMilliSeconds():int
        {
            return this._Str_11901;
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
            this._Str_3770 = k.readInteger();
            this._Str_11901 = k.readInteger();
            return true;
        }
    }
}
