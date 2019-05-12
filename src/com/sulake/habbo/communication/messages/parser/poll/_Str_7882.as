package com.sulake.habbo.communication.messages.parser.poll
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class _Str_7882 implements IMessageParser 
    {
        private var _id:int = -1;
        private var _type:String = "";
        private var _headline:String = "";
        private var _summary:String = "";


        public function get id():int
        {
            return this._id;
        }

        public function get type():String
        {
            return this._type;
        }

        public function get headline():String
        {
            return this._headline;
        }

        public function get summary():String
        {
            return this._summary;
        }

        public function flush():Boolean
        {
            this._id = -1;
            this._type = "";
            this._summary = "";
            return true;
        }

        public function parse(k:IMessageDataWrapper):Boolean
        {
            this._id = k.readInteger();
            this._type = k.readString();
            this._headline = k.readString();
            this._summary = k.readString();
            return true;
        }
    }
}
