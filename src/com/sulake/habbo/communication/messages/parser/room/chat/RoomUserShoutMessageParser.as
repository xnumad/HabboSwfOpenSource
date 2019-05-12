package com.sulake.habbo.communication.messages.parser.room.chat
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class RoomUserShoutMessageParser implements IMessageParser 
    {
        private var _userId:int = 0;
        private var _text:String = "";
        private var _links:Array;
        private var _gesture:int = 0;
        private var _animationLength:int = -1;
        private var _styleId:int = 0;


        public function get userId():int
        {
            return this._userId;
        }

        public function get text():String
        {
            return this._text;
        }

        public function get links():Array
        {
            return this._links;
        }

        public function get gesture():int
        {
            return this._gesture;
        }

        public function get _Str_20074():int
        {
            return this._animationLength;
        }

        public function get styleId():int
        {
            return this._styleId;
        }

        public function flush():Boolean
        {
            this._userId = 0;
            this._text = "";
            this._gesture = 0;
            this._links = null;
            return true;
        }

        public function parse(k:IMessageDataWrapper):Boolean
        {
            var _local_3:int;
            if (k == null)
            {
                return false;
            }
            this._userId = k.readInteger();
            this._text = k.readString();
            this._gesture = k.readInteger();
            this._styleId = k.readInteger();
            var _local_2:int = k.readInteger();
            if (_local_2 > 0)
            {
                this._links = new Array();
                _local_3 = 0;
                while (_local_3 < _local_2)
                {
                    this._links.push([k.readString(), k.readString(), k.readBoolean()]);
                    _local_3++;
                }
            }
            this._animationLength = k.readInteger();
            return true;
        }
    }
}
