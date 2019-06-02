//com.sulake.habbo.communication.messages.parser.inventory.bots.BotReceivedMessageParser

package com.sulake.habbo.communication.messages.parser.inventory.bots{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class BotReceivedMessageParser implements IMessageParser {

        private var _boughtAsGift:Boolean;
        private var _item:BotData;

        public function BotReceivedMessageParser();

        public function flush():Boolean;

        public function parse(k:IMessageDataWrapper):Boolean;

        public function get boughtAsGift():Boolean;

        public function get item():BotData;


    }
}//package com.sulake.habbo.communication.messages.parser.inventory.bots

