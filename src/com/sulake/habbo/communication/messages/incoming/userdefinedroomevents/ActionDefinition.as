package com.sulake.habbo.communication.messages.incoming.userdefinedroomevents
{
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class ActionDefinition extends Triggerable 
    {
        private var _type:int;
        private var _delayInPulses:int;
        private var _conflictingTriggers:Array;

        public function ActionDefinition(k:IMessageDataWrapper)
        {
            this._conflictingTriggers = new Array();
            super(k);
            this._type = k.readInteger();
            this._delayInPulses = k.readInteger();
            var _local_2:int = k.readInteger();
            var _local_3:int;
            while (_local_3 < _local_2)
            {
                this._conflictingTriggers.push(k.readInteger());
                _local_3++;
            }
        }

        public function get type():int
        {
            return this._type;
        }

        override public function get code():int
        {
            return this._type;
        }

        public function get delayInPulses():int
        {
            return this._delayInPulses;
        }

        public function get conflictingTriggers():Array
        {
            return this._conflictingTriggers;
        }
    }
}
