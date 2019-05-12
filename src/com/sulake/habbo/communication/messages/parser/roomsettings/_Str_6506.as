package com.sulake.habbo.communication.messages.parser.roomsettings
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class _Str_6506 implements IMessageParser 
    {
        private var _roomId:int;


        public function parse(k:IMessageDataWrapper):Boolean
        {
            this._roomId = k.readInteger();
            return true;
        }

        public function flush():Boolean
        {
            this._roomId = 0;
            return true;
        }

        public function get roomId():int
        {
            return this._roomId;
        }
    }
}
