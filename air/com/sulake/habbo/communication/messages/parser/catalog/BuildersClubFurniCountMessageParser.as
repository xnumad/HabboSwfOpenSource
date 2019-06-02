//com.sulake.habbo.communication.messages.parser.catalog.BuildersClubFurniCountMessageParser

package com.sulake.habbo.communication.messages.parser.catalog{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class BuildersClubFurniCountMessageParser implements IMessageParser {

        private var _furniCount:int;

        public function BuildersClubFurniCountMessageParser();

        public function flush():Boolean;

        public function parse(k:IMessageDataWrapper):Boolean;

        public function get furniCount():int;


    }
}//package com.sulake.habbo.communication.messages.parser.catalog

