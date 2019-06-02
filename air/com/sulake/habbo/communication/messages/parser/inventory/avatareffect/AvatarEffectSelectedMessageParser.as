//com.sulake.habbo.communication.messages.parser.inventory.avatareffect.AvatarEffectSelectedMessageParser

package com.sulake.habbo.communication.messages.parser.inventory.avatareffect{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class AvatarEffectSelectedMessageParser implements IMessageParser {

        private var _type:int;

        public function AvatarEffectSelectedMessageParser();

        public function flush():Boolean;

        public function parse(k:IMessageDataWrapper):Boolean;

        public function get type():int;


    }
}//package com.sulake.habbo.communication.messages.parser.inventory.avatareffect

