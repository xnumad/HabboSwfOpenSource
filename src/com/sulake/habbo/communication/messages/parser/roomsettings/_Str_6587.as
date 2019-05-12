package com.sulake.habbo.communication.messages.parser.roomsettings
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class _Str_6587 implements IMessageParser 
    {
        private var _roomId:int;
        private var _userId:int;


        public function flush():Boolean
        {
            this._roomId = 0;
            this._userId = 0;
            return true;
        }

        public function parse(k:IMessageDataWrapper):Boolean
        {
            this._roomId = k.readInteger();
            this._userId = k.readInteger();
            return true;
        }

        public function get roomId():int
        {
            return this._roomId;
        }

        public function get userId():int
        {
            return this._userId;
        }
    }
}
