//com.sulake.habbo.communication.messages.parser.room.bots.BotSkillData

package com.sulake.habbo.communication.messages.parser.room.bots{
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class BotSkillData {

        private var _id:int;
        private var _data:String;

        public function BotSkillData(k:IMessageDataWrapper);

        public function parse(k:IMessageDataWrapper):void;

        public function get id():int;

        public function get data():String;


    }
}//package com.sulake.habbo.communication.messages.parser.room.bots

