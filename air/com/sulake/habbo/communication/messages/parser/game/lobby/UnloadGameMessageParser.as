//com.sulake.habbo.communication.messages.parser.game.lobby.UnloadGameMessageParser

package com.sulake.habbo.communication.messages.parser.game.lobby{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class UnloadGameMessageParser implements IMessageParser {

        private var _gameTypeId:int;
        private var _gameClientId:String;

        public function UnloadGameMessageParser();

        public function get gameTypeId():int;

        public function get gameClientId():String;

        public function flush():Boolean;

        public function parse(k:IMessageDataWrapper):Boolean;


    }
}//package com.sulake.habbo.communication.messages.parser.game.lobby

