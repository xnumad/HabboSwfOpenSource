package com.sulake.habbo.communication.messages.parser.room.furniture
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class _Str_7443 implements IMessageParser 
    {
        private var _Str_4167:Boolean;
        private var _Str_6880:String;
        private var _buyout:Boolean;
        private var _priceInCredits:int;
        private var _priceInActivityPoints:int;
        private var _activityPointType:int;


        public function flush():Boolean
        {
            return true;
        }

        public function parse(k:IMessageDataWrapper):Boolean
        {
            this._Str_4167 = k.readBoolean();
            this._Str_6880 = k.readString();
            this._buyout = k.readBoolean();
            this._priceInCredits = k.readInteger();
            this._priceInActivityPoints = k.readInteger();
            this._activityPointType = k.readInteger();
            return true;
        }

        public function get _Str_2770():Boolean
        {
            return this._Str_4167;
        }

        public function get _Str_17878():String
        {
            return this._Str_6880;
        }

        public function get buyout():Boolean
        {
            return this._buyout;
        }

        public function get priceInCredits():int
        {
            return this._priceInCredits;
        }

        public function get priceInActivityPoints():int
        {
            return this._priceInActivityPoints;
        }

        public function get activityPointType():int
        {
            return this._activityPointType;
        }
    }
}
