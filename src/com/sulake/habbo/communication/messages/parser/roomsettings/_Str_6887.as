package com.sulake.habbo.communication.messages.parser.roomsettings
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class _Str_6887 implements IMessageParser 
    {
        private var _flatId:int;
        private var _userId:int;


        public function flush():Boolean
        {
            return true;
        }

        public function parse(k:IMessageDataWrapper):Boolean
        {
            this._flatId = k.readInteger();
            this._userId = k.readInteger();
            return true;
        }

        public function get flatId():int
        {
            return this._flatId;
        }

        public function get userId():int
        {
            return this._userId;
        }
    }
}
