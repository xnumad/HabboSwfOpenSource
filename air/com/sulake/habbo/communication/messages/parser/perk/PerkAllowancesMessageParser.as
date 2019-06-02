//com.sulake.habbo.communication.messages.parser.perk.PerkAllowancesMessageParser

package com.sulake.habbo.communication.messages.parser.perk{
    import com.sulake.core.communication.messages.IMessageParser;
    import __AS3__.vec.Vector;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class PerkAllowancesMessageParser implements IMessageParser {

        private var _perks:Vector.<Perk>;

        public function PerkAllowancesMessageParser();

        public function flush():Boolean;

        public function parse(k:IMessageDataWrapper):Boolean;

        public function getPerks():Vector.<Perk>;

        public function isPerkAllowed(k:String):Boolean;

        public function getPerk(k:String):Perk;


    }
}//package com.sulake.habbo.communication.messages.parser.perk

