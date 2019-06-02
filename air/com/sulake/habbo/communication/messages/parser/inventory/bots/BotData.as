//com.sulake.habbo.communication.messages.parser.inventory.bots.BotData

package com.sulake.habbo.communication.messages.parser.inventory.bots{
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class BotData {

        private var _id:int;
        private var _name:String;
        private var _motto:String;
        private var _gender:String;
        private var _figure:String;

        public function BotData(k:IMessageDataWrapper);

        public function get id():int;

        public function get name():String;

        public function get motto():String;

        public function get figure():String;

        public function get gender():String;


    }
}//package com.sulake.habbo.communication.messages.parser.inventory.bots

