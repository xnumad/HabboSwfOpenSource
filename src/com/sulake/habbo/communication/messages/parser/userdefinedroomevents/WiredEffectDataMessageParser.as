package com.sulake.habbo.communication.messages.parser.userdefinedroomevents
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.habbo.communication.messages.incoming.userdefinedroomevents.ActionDefinition;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class WiredEffectDataMessageParser implements IMessageParser 
    {
        private var _definition:ActionDefinition;


        public function flush():Boolean
        {
            this._definition = null;
            return true;
        }

        public function parse(k:IMessageDataWrapper):Boolean
        {
            this._definition = new ActionDefinition(k);
            return true;
        }

        public function get definition():ActionDefinition
        {
            return this._definition;
        }
    }
}
