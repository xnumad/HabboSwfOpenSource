//com.sulake.habbo.communication.messages.parser.inventory.avatareffect.AvatarEffectAddedMessageParser

package com.sulake.habbo.communication.messages.parser.inventory.avatareffect{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class AvatarEffectAddedMessageParser implements IMessageParser {

        private var _type:int;
        private var _subType:int;
        private var _duration:int;

        public function AvatarEffectAddedMessageParser();

        public function flush():Boolean;

        public function parse(k:IMessageDataWrapper):Boolean;

        public function get type():int;

        public function get subType():int;

        public function get duration():int;


    }
}//package com.sulake.habbo.communication.messages.parser.inventory.avatareffect

