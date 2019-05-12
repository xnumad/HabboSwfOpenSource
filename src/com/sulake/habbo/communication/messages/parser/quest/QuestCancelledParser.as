package com.sulake.habbo.communication.messages.parser.quest
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class QuestCancelledParser implements IMessageParser 
    {
        private var _expired:Boolean;


        public function flush():Boolean
        {
            return true;
        }

        public function parse(k:IMessageDataWrapper):Boolean
        {
            this._expired = k.readBoolean();
            return true;
        }

        public function get expired():Boolean
        {
            return this._expired;
        }
    }
}
