package com.sulake.habbo.communication.messages.parser.game.score
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.habbo.communication.messages.incoming.catalog._Str_2853;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class _Str_8582 implements IMessageParser 
    {
        private var _gameTypeId:int;
        private var _products:Array;
        private var _Str_17600:int;
        private var _Str_16182:Boolean;

        public function _Str_8582()
        {
            this._products = [];
            super();
        }

        public function get gameTypeId():int
        {
            return this._gameTypeId;
        }

        public function get products():Array
        {
            return this._products;
        }

        public function get _Str_25946():int
        {
            return this._Str_17600;
        }

        public function get _Str_26137():Boolean
        {
            return this._Str_16182;
        }

        public function flush():Boolean
        {
            this._gameTypeId = -1;
            this._products = [];
            this._Str_17600 = 0;
            this._Str_16182 = true;
            return true;
        }

        public function parse(k:IMessageDataWrapper):Boolean
        {
            this._gameTypeId = k.readInteger();
            var _local_2:int = k.readInteger();
            var _local_3:int;
            while (_local_3 < _local_2)
            {
                this._products.push(new _Str_2853(k));
                _local_3++;
            }
            this._Str_17600 = k.readInteger();
            this._Str_16182 = k.readBoolean();
            return true;
        }
    }
}
