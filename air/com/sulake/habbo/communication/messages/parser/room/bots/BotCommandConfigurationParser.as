//com.sulake.habbo.communication.messages.parser.room.bots.BotCommandConfigurationParser

package com.sulake.habbo.communication.messages.parser.room.bots{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class BotCommandConfigurationParser implements IMessageParser {

        private var _botId:int;
        private var _commandId:int;
        private var _data:String;

        public function BotCommandConfigurationParser();

        public function get botId():int;

        public function get commandId():int;

        public function get data():String;

        public function flush():Boolean;

        public function parse(k:IMessageDataWrapper):Boolean;


    }
}//package com.sulake.habbo.communication.messages.parser.room.bots

