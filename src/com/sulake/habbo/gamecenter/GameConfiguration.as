package com.sulake.habbo.gamecenter
{
    public class GameConfiguration 
    {
        private var _gameId:int;
        private var _gameNameId:String;
        private var _bgColor:uint;
        private var _textColor:uint;
        private var _assetUrl:String;
        private var _supportUrl:String;

        public function GameConfiguration(k:int, _arg_2:String, _arg_3:uint, _arg_4:uint, _arg_5:String, _arg_6:String)
        {
            this._gameId = k;
            this._gameNameId = _arg_2;
            this._bgColor = _arg_3;
            this._textColor = _arg_4;
            this._assetUrl = _arg_5;
            this._supportUrl = _arg_6;
            if (this._assetUrl.substr((this._assetUrl.length - 1), 1) != "/")
            {
                this._assetUrl = (this._assetUrl + "/");
            }
        }

        public function get gameId():int
        {
            return this._gameId;
        }

        public function get gameNameId():String
        {
            return this._gameNameId;
        }

        public function get bgColor():uint
        {
            return this._bgColor;
        }

        public function get textColor():uint
        {
            return this._textColor;
        }

        public function get assetUrl():String
        {
            return this._assetUrl;
        }

        public function get supportUrl():String
        {
            return this._supportUrl;
        }
    }
}
