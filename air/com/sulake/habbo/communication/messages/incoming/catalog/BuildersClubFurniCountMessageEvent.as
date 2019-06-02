//com.sulake.habbo.communication.messages.incoming.catalog.BuildersClubFurniCountMessageEvent

package com.sulake.habbo.communication.messages.incoming.catalog{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.catalog.BuildersClubFurniCountMessageParser;

    public class BuildersClubFurniCountMessageEvent extends MessageEvent implements IMessageEvent {

        public function BuildersClubFurniCountMessageEvent(k:Function);

        public function getParser():BuildersClubFurniCountMessageParser;


    }
}//package com.sulake.habbo.communication.messages.incoming.catalog

