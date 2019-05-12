package com.sulake.habbo.communication.messages.parser.userdefinedroomevents
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.habbo.communication.messages.incoming.userdefinedroomevents.TriggerDefinition;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class WiredTriggerDataMessageParser implements IMessageParser 
    {
        private var _Str_4948:TriggerDefinition;


        public function flush():Boolean
        {
            this._Str_4948 = null;
            return true;
        }

        public function parse(k:IMessageDataWrapper):Boolean
        {
            this._Str_4948 = new TriggerDefinition(k);
            return true;
        }

        public function get _Str_10812():TriggerDefinition
        {
            return this._Str_4948;
        }
    }
}
