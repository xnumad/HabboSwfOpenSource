package com.sulake.habbo.communication.messages.incoming.userdefinedroomevents
{
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class TriggerDefinition extends Triggerable 
    {
        private var _triggerConf:int;
        private var _conflictingActions:Array;

        public function TriggerDefinition(k:IMessageDataWrapper)
        {
            this._conflictingActions = new Array();
            super(k);
            this._triggerConf = k.readInteger();
            var count:int = k.readInteger();
            var index:int;
            while (index < count)
            {
                this._conflictingActions.push(k.readInteger());
                index++;
            }
        }

        public function get type():int
        {
            return this._triggerConf;
        }

        override public function get code():int
        {
            return this._triggerConf;
        }

        public function get conflictingActions():Array
        {
            return this._conflictingActions;
        }
    }
}
