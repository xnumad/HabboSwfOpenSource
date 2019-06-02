//com.sulake.habbo.communication.messages.parser.game.lobby.LeftQueueMessageParser

package com.sulake.habbo.communication.messages.parser.game.lobby{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class LeftQueueMessageParser implements IMessageParser {

        private var _gameTypeId:int;

        public function LeftQueueMessageParser();

        public function get gameTypeId():int;

        public function flush():Boolean;

        public function parse(k:IMessageDataWrapper):Boolean;


    }
}//package com.sulake.habbo.communication.messages.parser.game.lobby

