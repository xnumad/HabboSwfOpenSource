package com.sulake.habbo.communication.messages.parser.navigator
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class CanCreateRoomEventMessageParser implements IMessageParser
    {
        private var _Str_20547:Boolean;
        private var _errorCode:int;


        public function flush():Boolean
        {
            return true;
        }

        public function parse(k:IMessageDataWrapper):Boolean
        {
            this._Str_20547 = k.readBoolean();
            this._errorCode = k.readInteger();
            return true;
        }

        public function get _Str_13420():Boolean
        {
            return this._Str_20547;
        }

        public function get errorCode():int
        {
            return this._errorCode;
        }
    }
}
