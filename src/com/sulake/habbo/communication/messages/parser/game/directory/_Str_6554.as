package com.sulake.habbo.communication.messages.parser.game.directory
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class _Str_6554 implements IMessageParser 
    {
        private var _gameTypeId:int;
        private var _Str_7940:int;
        private var _Str_21057:int;


        public function get gameTypeId():int
        {
            return this._gameTypeId;
        }

        public function get _Str_21510():int
        {
            return this._Str_7940;
        }

        public function get _Str_22319():int
        {
            return this._Str_21057;
        }

        public function get _Str_23843():Boolean
        {
            return this._Str_7940 == -1;
        }

        public function flush():Boolean
        {
            return true;
        }

        public function parse(k:IMessageDataWrapper):Boolean
        {
            this._gameTypeId = k.readInteger();
            this._Str_7940 = k.readInteger();
            this._Str_21057 = k.readInteger();
            return true;
        }
    }
}
