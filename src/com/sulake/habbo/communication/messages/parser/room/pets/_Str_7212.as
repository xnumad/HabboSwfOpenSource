package com.sulake.habbo.communication.messages.parser.room.pets
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class _Str_7212 implements IMessageParser 
    {
        private var _roomIndex:int;
        private var _Str_2388:int;
        private var _level:int;


        public function get roomIndex():int
        {
            return this._roomIndex;
        }

        public function get _Str_2508():int
        {
            return this._Str_2388;
        }

        public function get level():int
        {
            return this._level;
        }

        public function flush():Boolean
        {
            return true;
        }

        public function parse(k:IMessageDataWrapper):Boolean
        {
            this._roomIndex = k.readInteger();
            this._Str_2388 = k.readInteger();
            this._level = k.readInteger();
            return true;
        }
    }
}
