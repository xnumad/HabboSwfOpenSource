package com.sulake.habbo.communication.messages.parser.users
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class _Str_6592 implements IMessageParser 
    {
        private var _Str_6739:int;
        private var _groupId:int;


        public function flush():Boolean
        {
            return true;
        }

        public function parse(k:IMessageDataWrapper):Boolean
        {
            this._Str_6739 = k.readInteger();
            this._groupId = k.readInteger();
            return true;
        }

        public function get baseRoomId():int
        {
            return this._Str_6739;
        }

        public function get groupId():int
        {
            return this._groupId;
        }
    }
}
