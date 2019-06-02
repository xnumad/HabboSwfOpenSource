//com.sulake.habbo.communication.messages.parser.room.engine.FurnitureAliasesMessageParser

package com.sulake.habbo.communication.messages.parser.room.engine{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.utils.Map;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class FurnitureAliasesMessageParser implements IMessageParser {

        private var _aliases:Map;

        public function FurnitureAliasesMessageParser();

        public function get aliasCount():int;

        public function getName(k:int):String;

        public function getAlias(k:int):String;

        public function flush():Boolean;

        public function parse(k:IMessageDataWrapper):Boolean;


    }
}//package com.sulake.habbo.communication.messages.parser.room.engine

