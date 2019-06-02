package com.sulake.habbo.communication.messages.parser.room.engine
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class _Str_5772 implements IMessageParser 
    {
        private var _id:int;
        private var _figure:String;
        private var _Str_4037:String;
        private var _Str_8430:String;
        private var _activityPoints:int;


        public function get id():int
        {
            return this._id;
        }

        public function get figure():String
        {
            return this._figure;
        }

        public function get _Str_3344():String
        {
            return this._Str_4037;
        }

        public function get customInfo():String
        {
            return this._Str_8430;
        }

        public function get activityPoints():int
        {
            return this._activityPoints;
        }

        public function flush():Boolean
        {
            this._id = 0;
            this._figure = "";
            this._Str_4037 = "";
            this._Str_8430 = "";
            return true;
        }

        public function parse(k:IMessageDataWrapper):Boolean
        {
            this._id = k.readInteger();
            this._figure = k.readString();
            this._Str_4037 = k.readString();
            this._Str_8430 = k.readString();
            this._activityPoints = k.readInteger();
            if (this._Str_4037)
            {
                this._Str_4037 = this._Str_4037.toUpperCase();
            }
            return true;
        }
    }
}
