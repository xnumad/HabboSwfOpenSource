//com.sulake.habbo.communication.messages.parser.game.lobby.LoadGameMessageParser

package com.sulake.habbo.communication.messages.parser.game.lobby{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class LoadGameMessageParser implements IMessageParser {

        private var _gameTypeId:int;
        private var _url:String;
        private var _quality:String;
        private var _scaleMode:String;
        private var _frameRate:int;
        private var _minMajorVersion:int;
        private var _minMinorVersion:int;
        private var _params:Object;
        private var _gameClientId:String;

        public function LoadGameMessageParser();

        public function get gameTypeId():int;

        public function get url():String;

        public function get quality():String;

        public function get scaleMode():String;

        public function get frameRate():int;

        public function get minMajorVersion():int;

        public function get minMinorVersion():int;

        public function get params():Object;

        public function get gameClientId():String;

        public function flush():Boolean;

        public function parse(k:IMessageDataWrapper):Boolean;


    }
}//package com.sulake.habbo.communication.messages.parser.game.lobby

