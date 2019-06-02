package com.sulake.habbo.communication.messages.parser.room.engine
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class _Str_7301 implements IMessageParser 
    {
        private var _Str_2775:int;
        private var _Str_6639:int;
        private var _status:int;
        private var _Str_11227:String;


        public function flush():Boolean
        {
            return true;
        }

        public function parse(k:IMessageDataWrapper):Boolean
        {
            this._Str_2775 = k.readInteger();
            this._Str_6639 = k.readInteger();
            this._status = k.readInteger();
            this._Str_11227 = k.readString();
            return true;
        }

        public function get roomIndex():int
        {
            return this._Str_2775;
        }

        public function get habboGroupId():int
        {
            return this._Str_6639;
        }

        public function get status():int
        {
            return this._status;
        }

        public function get habboGroupName():String
        {
            return this._Str_11227;
        }
    }
}
