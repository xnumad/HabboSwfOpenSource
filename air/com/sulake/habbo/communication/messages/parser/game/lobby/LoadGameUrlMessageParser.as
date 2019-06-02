//com.sulake.habbo.communication.messages.parser.game.lobby.LoadGameUrlMessageParser

package com.sulake.habbo.communication.messages.parser.game.lobby{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class LoadGameUrlMessageParser implements IMessageParser {

        private var _gameTypeId:int;
        private var _url:String;
        private var _gameClientId:String;

        public function LoadGameUrlMessageParser();

        public function get gameTypeId():int;

        public function get url():String;

        public function get gameClientId():String;

        public function flush():Boolean;

        public function parse(k:IMessageDataWrapper):Boolean;


    }
}//package com.sulake.habbo.communication.messages.parser.game.lobby

