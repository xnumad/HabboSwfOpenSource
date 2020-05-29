package com.sulake.habbo.communication.messages.incoming.avatar
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.avatar.FigureUpdateParser;

    public class FigureUpdateEvent extends MessageEvent implements IMessageEvent
    {
        public function FigureUpdateEvent(k:Function)
        {
            super(k, FigureUpdateParser);
        }

        private function getParser():FigureUpdateParser
        {
            return this._parser as FigureUpdateParser;
        }

        public function get figure():String
        {
            return (_parser as FigureUpdateParser).figure;
        }

        public function get gender():String
        {
            return (_parser as FigureUpdateParser).gender;
        }
    }
}
