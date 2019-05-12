package com.sulake.habbo.communication.messages.parser.room.session
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class _Str_7901 implements IMessageParser 
    {
        private var _roomId:int;


        public function get roomId():int
        {
            return this._roomId;
        }

        public function flush():Boolean
        {
            return true;
        }

        public function parse(k:IMessageDataWrapper):Boolean
        {
            this._roomId = k.readInteger();
            return true;
        }
    }
}
