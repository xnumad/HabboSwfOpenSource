package com.sulake.habbo.communication.messages.parser.availability
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class MaintenanceStatusMessageParser implements IMessageParser
    {
        private var _isInMaintenance:Boolean;
        private var _minutesUntilMaintenance:int;
        private var _duration:int = 15;


        public function get isInMaintenance():Boolean
        {
            return this._isInMaintenance;
        }

        public function get _Str_23709():int
        {
            return this._minutesUntilMaintenance;
        }

        public function get duration():int
        {
            return this._duration;
        }

        public function flush():Boolean
        {
            return true;
        }

        public function parse(k:IMessageDataWrapper):Boolean
        {
            this._isInMaintenance = k.readBoolean();
            this._minutesUntilMaintenance = k.readInteger();
            if (k.bytesAvailable)
            {
                this._duration = k.readInteger();
            }
            return true;
        }
    }
}
