package com.sulake.habbo.communication.messages.parser.navigator
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class NavigatorSettingsMessageParser implements IMessageParser
    {
        private var _Str_7066:int;
        private var _roomIdToEnter:int;


        public function flush():Boolean
        {
            return true;
        }

        public function parse(k:IMessageDataWrapper):Boolean
        {
            this._Str_7066 = k.readInteger();
            this._roomIdToEnter = k.readInteger();
            return true;
        }

        public function get homeRoomId():int
        {
            return this._Str_7066;
        }

        public function get _Str_17213():int
        {
            return this._roomIdToEnter;
        }
    }
}
