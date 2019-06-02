package com.sulake.habbo.communication.messages.parser.room.engine
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class _Str_8155 implements IMessageParser 
    {
        private var _id:int = 0;
        private var _Str_9228:String;


        public function get id():int
        {
            return this._id;
        }

        public function get itemData():String
        {
            return this._Str_9228;
        }

        public function flush():Boolean
        {
            this._id = 0;
            this._Str_9228 = "";
            return true;
        }

        public function parse(k:IMessageDataWrapper):Boolean
        {
            if (k == null)
            {
                return false;
            }
            var _local_2:String = k.readString();
            this._id = int(_local_2);
            this._Str_9228 = k.readString();
            return true;
        }
    }
}
