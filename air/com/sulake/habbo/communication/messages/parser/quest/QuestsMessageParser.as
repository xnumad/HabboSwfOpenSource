//com.sulake.habbo.communication.messages.parser.quest.QuestsMessageParser

package com.sulake.habbo.communication.messages.parser.quest{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class QuestsMessageParser implements IMessageParser {

        private var _quests:Array;
        private var _openWindow:Boolean;

        public function QuestsMessageParser();

        public function flush():Boolean;

        public function parse(k:IMessageDataWrapper):Boolean;

        public function get quests():Array;

        public function get openWindow():Boolean;


    }
}//package com.sulake.habbo.communication.messages.parser.quest

