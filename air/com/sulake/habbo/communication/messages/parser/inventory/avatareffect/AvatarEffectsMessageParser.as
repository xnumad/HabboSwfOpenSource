//com.sulake.habbo.communication.messages.parser.inventory.avatareffect.AvatarEffectsMessageParser

package com.sulake.habbo.communication.messages.parser.inventory.avatareffect{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class AvatarEffectsMessageParser implements IMessageParser {

        private var _effects:Array;

        public function AvatarEffectsMessageParser();

        public function flush():Boolean;

        public function parse(k:IMessageDataWrapper):Boolean;

        public function get effects():Array;


    }
}//package com.sulake.habbo.communication.messages.parser.inventory.avatareffect

