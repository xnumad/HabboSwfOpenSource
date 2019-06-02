//com.sulake.habbo.communication.messages.parser.room.bots.BotForceOpenContextMenuParser

package com.sulake.habbo.communication.messages.parser.room.bots{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class BotForceOpenContextMenuParser implements IMessageParser {

        private var _botId:int;

        public function BotForceOpenContextMenuParser();

        public function flush():Boolean;

        public function parse(k:IMessageDataWrapper):Boolean;

        public function get botId():int;


    }
}//package com.sulake.habbo.communication.messages.parser.room.bots

