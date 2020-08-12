package com.sulake.habbo.communication.messages.parser.navigator
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.habbo.communication.messages.incoming.navigator.CompetitionRoomsData;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class CompetitionRoomsDataMessageParser implements IMessageParser
    {
        private var _data:CompetitionRoomsData;


        public function flush():Boolean
        {
            return true;
        }

        public function parse(k:IMessageDataWrapper):Boolean
        {
            this._data = new CompetitionRoomsData(k);
            return true;
        }

        public function get data():CompetitionRoomsData
        {
            return this._data;
        }
    }
}
