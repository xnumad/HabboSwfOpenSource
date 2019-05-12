package com.sulake.habbo.communication.messages.parser.catalog
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class _Str_7888 implements IMessageParser 
    {
        private var _Str_17433:Boolean = false;
        private var _Str_19031:Boolean = false;
        private var _activityPointType:int = 0;


        public function get _Str_16424():Boolean
        {
            return this._Str_17433;
        }

        public function get _Str_24352():Boolean
        {
            return this._Str_19031;
        }

        public function get activityPointType():int
        {
            return this._activityPointType;
        }

        public function flush():Boolean
        {
            this._Str_17433 = false;
            this._Str_19031 = false;
            this._activityPointType = 0;
            return true;
        }

        public function parse(k:IMessageDataWrapper):Boolean
        {
            this._Str_17433 = k.readBoolean();
            this._Str_19031 = k.readBoolean();
            if (k.bytesAvailable)
            {
                this._activityPointType = k.readInteger();
            }
            return true;
        }
    }
}
