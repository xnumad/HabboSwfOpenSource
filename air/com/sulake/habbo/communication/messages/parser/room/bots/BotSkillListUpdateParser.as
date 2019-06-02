//com.sulake.habbo.communication.messages.parser.room.bots.BotSkillListUpdateParser

package com.sulake.habbo.communication.messages.parser.room.bots{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class BotSkillListUpdateParser implements IMessageParser {

        private var _botId:int;
        private var _skillList:Array;

        public function BotSkillListUpdateParser();

        public function get skillList():Array;

        public function get botId():int;

        public function flush():Boolean;

        public function parse(k:IMessageDataWrapper):Boolean;


    }
}//package com.sulake.habbo.communication.messages.parser.room.bots

