//com.sulake.habbo.communication.messages.parser.room.action.AvatarEffectMessageParser

package com.sulake.habbo.communication.messages.parser.room.action{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class AvatarEffectMessageParser implements IMessageParser {

        private var _userId:int;
        private var _effectId:int;
        private var _delayMilliSeconds:int;

        public function AvatarEffectMessageParser();

        public function get userId():int;

        public function get effectId():int;

        public function get delayMilliSeconds():int;

        public function flush():Boolean;

        public function parse(k:IMessageDataWrapper):Boolean;


    }
}//package com.sulake.habbo.communication.messages.parser.room.action

