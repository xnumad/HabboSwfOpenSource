package com.sulake.habbo.communication.messages.parser.game.score
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class _Str_7341 implements IMessageParser 
    {
        private var _gameTypeId:int;
        private var _Str_15876:Array;

        public function _Str_7341()
        {
            this._Str_15876 = [];
            super();
        }

        public function get gameTypeId():int
        {
            return this._gameTypeId;
        }

        public function get _Str_24920():Array
        {
            return this._Str_15876;
        }

        public function flush():Boolean
        {
            this._gameTypeId = -1;
            this._Str_15876 = [];
            return true;
        }

        public function parse(k:IMessageDataWrapper):Boolean
        {
            this._gameTypeId = k.readInteger();
            var _local_2:int = k.readInteger();
            var _local_3:int;
            while (_local_3 < _local_2)
            {
                this._Str_15876.push(new _Str_7552(k));
                _local_3++;
            }
            return true;
        }
    }
}
