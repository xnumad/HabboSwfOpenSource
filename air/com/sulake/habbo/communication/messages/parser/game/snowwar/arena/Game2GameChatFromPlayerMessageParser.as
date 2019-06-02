//com.sulake.habbo.communication.messages.parser.game.snowwar.arena.Game2GameChatFromPlayerMessageParser

package com.sulake.habbo.communication.messages.parser.game.snowwar.arena{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class Game2GameChatFromPlayerMessageParser implements IMessageParser {

        private var _userId:int;
        private var _chatMessage:String;

        public function Game2GameChatFromPlayerMessageParser();

        public function flush():Boolean;

        public function parse(k:IMessageDataWrapper):Boolean;

        public function get userId():int;

        public function get chatMessage():String;


    }
}//package com.sulake.habbo.communication.messages.parser.game.snowwar.arena

