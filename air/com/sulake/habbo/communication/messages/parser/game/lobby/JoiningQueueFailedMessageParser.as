//com.sulake.habbo.communication.messages.parser.game.lobby.JoiningQueueFailedMessageParser

package com.sulake.habbo.communication.messages.parser.game.lobby{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class JoiningQueueFailedMessageParser implements IMessageParser {

        public static const DUPLICATE_MACHINEID:int;

        private var _gameTypeId:int;
        private var _reason:int;

        public function JoiningQueueFailedMessageParser();

        public function get gameTypeId():int;

        public function get reason():int;

        public function flush():Boolean;

        public function parse(k:IMessageDataWrapper):Boolean;


    }
}//package com.sulake.habbo.communication.messages.parser.game.lobby

