package com.sulake.habbo.communication.messages.incoming.catalog
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.catalog.BuildersClubFurniCountMessageParser;

    public class BuildersClubFurniCountMessageEvent extends MessageEvent implements IMessageEvent
    {
        public function BuildersClubFurniCountMessageEvent(k:Function)
        {
            super(k, BuildersClubFurniCountMessageParser);
        }

        public function getParser():BuildersClubFurniCountMessageParser
        {
            return this._parser as BuildersClubFurniCountMessageParser;
        }
    }
}
