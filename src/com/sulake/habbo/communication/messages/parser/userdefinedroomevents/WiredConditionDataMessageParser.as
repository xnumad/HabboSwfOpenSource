package com.sulake.habbo.communication.messages.parser.userdefinedroomevents
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.habbo.communication.messages.incoming.userdefinedroomevents.ConditionDefinition;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class WiredConditionDataMessageParser implements IMessageParser 
    {
        private var _definition:ConditionDefinition;


        public function flush():Boolean
        {
            this._definition = null;
            return true;
        }

        public function parse(k:IMessageDataWrapper):Boolean
        {
            this._definition = new ConditionDefinition(k);
            return true;
        }

        public function get definition():ConditionDefinition
        {
            return this._definition;
        }
    }
}
