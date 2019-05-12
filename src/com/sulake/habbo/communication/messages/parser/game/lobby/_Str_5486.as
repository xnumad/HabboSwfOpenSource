package com.sulake.habbo.communication.messages.parser.game.lobby
{
    public class _Str_5486 
    {
        private var _Str_11002:int;
        private var _Str_9763:String;
        private var _bgColor:uint;
        private var _textColor:uint;
        private var _Str_5746:String;
        private var _Str_11032:String;

        public function _Str_5486(k:int, _arg_2:String, _arg_3:uint, _arg_4:uint, _arg_5:String, _arg_6:String)
        {
            this._Str_11002 = k;
            this._Str_9763 = _arg_2;
            this._bgColor = _arg_3;
            this._textColor = _arg_4;
            this._Str_5746 = _arg_5;
            this._Str_11032 = _arg_6;
        }

        public function get _Str_5333():int
        {
            return this._Str_11002;
        }

        public function get _Str_9827():String
        {
            return this._Str_9763;
        }

        public function get bgColor():uint
        {
            return this._bgColor;
        }

        public function get textColor():uint
        {
            return this._textColor;
        }

        public function get _Str_15765():String
        {
            return this._Str_5746;
        }

        public function get _Str_14248():String
        {
            return this._Str_11032;
        }
    }
}
