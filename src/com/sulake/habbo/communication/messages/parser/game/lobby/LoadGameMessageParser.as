package com.sulake.habbo.communication.messages.parser.game.lobby
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class LoadGameMessageParser implements IMessageParser 
    {
        private var _gameTypeId:int;
        private var _url:String;
        private var _quality:String;
        private var _scaleMode:String;
        private var _frameRate:int;
        private var _minMajorVersion:int;
        private var _minMinorVersion:int;
        private var _params:Object;
        private var _gameClientId:String;


        public function get gameTypeId():int
        {
            return this._gameTypeId;
        }

        public function get url():String
        {
            return this._url;
        }

        public function get quality():String
        {
            return this._quality;
        }

        public function get scaleMode():String
        {
            return this._scaleMode;
        }

        public function get frameRate():int
        {
            return this._frameRate;
        }

        public function get minMajorVersion():int
        {
            return this._minMajorVersion;
        }

        public function get minMinorVersion():int
        {
            return this._minMinorVersion;
        }

        public function get params():Object
        {
            return this._params;
        }

        public function get _Str_12486():String
        {
            return this._gameClientId;
        }

        public function flush():Boolean
        {
            return true;
        }

        public function parse(k:IMessageDataWrapper):Boolean
        {
            this._gameTypeId = k.readInteger();
            this._gameClientId = k.readString();
            this._url = k.readString();
            this._quality = k.readString();
            this._scaleMode = k.readString();
            this._frameRate = k.readInteger();
            this._minMajorVersion = k.readInteger();
            this._minMinorVersion = k.readInteger();
            this._params = new Object();
            var _local_2:int = k.readInteger();
            var _local_3:int;
            while (_local_3 < _local_2)
            {
                this.params[k.readString()] = k.readString();
                _local_3++;
            }
            return true;
        }
    }
}
