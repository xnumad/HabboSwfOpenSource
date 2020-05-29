package com.sulake.habbo.communication.messages.parser.availability
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class AvailabilityStatusMessageParser implements IMessageParser
    {
        private var _isOpen:Boolean;
        private var _onShutDown:Boolean;
        private var _isAuthenticHabbo:Boolean;


        public function get isOpen():Boolean
        {
            return this._isOpen;
        }

        public function get onShutDown():Boolean
        {
            return this._onShutDown;
        }

        public function get isAuthenticHabbo():Boolean
        {
            return this._isAuthenticHabbo;
        }

        public function flush():Boolean
        {
            this._isOpen = false;
            this._onShutDown = false;
            this._isAuthenticHabbo = false;
            return true;
        }

        public function parse(k:IMessageDataWrapper):Boolean
        {
            this._isOpen = k.readBoolean();
            this._onShutDown = k.readBoolean();
            if (k.bytesAvailable)
            {
                this._isAuthenticHabbo = k.readBoolean();
            }
            return true;
        }
    }
}
