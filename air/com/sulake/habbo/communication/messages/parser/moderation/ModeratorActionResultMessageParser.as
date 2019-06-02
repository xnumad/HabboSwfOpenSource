//com.sulake.habbo.communication.messages.parser.moderation.ModeratorActionResultMessageParser

package com.sulake.habbo.communication.messages.parser.moderation{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class ModeratorActionResultMessageParser implements IMessageParser {

        private var _userId:int;
        private var _success:Boolean;

        public function ModeratorActionResultMessageParser();

        public function get userId():int;

        public function get success():Boolean;

        public function flush():Boolean;

        public function parse(k:IMessageDataWrapper):Boolean;


    }
}//package com.sulake.habbo.communication.messages.parser.moderation

