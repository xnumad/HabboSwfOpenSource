package com.sulake.habbo.communication.messages.parser.groupforums
{
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class _Str_2814 
    {
        private var _groupId:int;
        private var _messageId:int;
        private var _messageIndex:int;
        private var _Str_21082:int;
        private var _threadId:int;
        private var _creationTime:int;
        private var _Str_2992:String;
        private var _Str_20600:String;
        private var _Str_21796:String;
        private var _state:int;
        private var _Str_11523:int;
        private var _Str_12139:String;
        private var _Str_20143:int;
        private var _Str_21485:int;


        public static function _Str_4933(k:IMessageDataWrapper):_Str_2814
        {
            var _local_2:_Str_2814 = new (_Str_2814)();
            _local_2.messageId = k.readInteger();
            _local_2.messageIndex = k.readInteger();
            _local_2._Str_18036 = k.readInteger();
            _local_2._Str_6415 = k.readString();
            _local_2._Str_18957 = k.readString();
            _local_2._Str_6238 = k.readInteger();
            _local_2._Str_3460 = k.readString();
            _local_2.state = k.readByte();
            _local_2._Str_9776 = k.readInteger();
            _local_2._Str_6110 = k.readString();
            _local_2._Str_20798 = k.readInteger();
            _local_2._Str_17584 = k.readInteger();
            return _local_2;
        }


        public function get state():int
        {
            return this._state;
        }

        public function set state(k:int):void
        {
            this._state = k;
        }

        public function get _Str_9776():int
        {
            return this._Str_11523;
        }

        public function set _Str_9776(k:int):void
        {
            this._Str_11523 = k;
        }

        public function get _Str_6110():String
        {
            return this._Str_12139;
        }

        public function set _Str_6110(k:String):void
        {
            this._Str_12139 = k;
        }

        public function get _Str_20798():int
        {
            return this._Str_20143;
        }

        public function set _Str_20798(k:int):void
        {
            this._Str_20143 = k;
        }

        public function get _Str_23476():int
        {
            return this._messageId;
        }

        public function set _Str_23476(k:int):void
        {
            this._messageId = k;
        }

        public function get creationTime():int
        {
            return this._creationTime;
        }

        public function set creationTime(k:int):void
        {
            this._creationTime = k;
        }

        public function get _Str_6415():String
        {
            return this._Str_20600;
        }

        public function set _Str_6415(k:String):void
        {
            this._Str_20600 = k;
        }

        public function get _Str_18957():String
        {
            return this._Str_21796;
        }

        public function set _Str_18957(k:String):void
        {
            this._Str_21796 = k;
        }

        public function get threadId():int
        {
            return this._threadId;
        }

        public function set threadId(k:int):void
        {
            this._threadId = k;
        }

        public function get messageId():int
        {
            return this._messageId;
        }

        public function set messageId(k:int):void
        {
            this._messageId = k;
        }

        public function get messageIndex():int
        {
            return this._messageIndex;
        }

        public function set messageIndex(k:int):void
        {
            this._messageIndex = k;
        }

        public function set _Str_4592(k:int):void
        {
            this._groupId = k;
        }

        public function get groupId():int
        {
            return this._groupId;
        }

        public function get _Str_18036():int
        {
            return this._Str_21082;
        }

        public function set _Str_18036(k:int):void
        {
            this._Str_21082 = k;
        }

        public function get _Str_6238():int
        {
            return this._creationTime;
        }

        public function set _Str_6238(k:int):void
        {
            this._creationTime = k;
        }

        public function get _Str_3460():String
        {
            return this._Str_2992;
        }

        public function set _Str_3460(k:String):void
        {
            this._Str_2992 = k;
        }

        public function get _Str_17584():int
        {
            return this._Str_21485;
        }

        public function set _Str_17584(k:int):void
        {
            this._Str_21485 = k;
        }
    }
}
