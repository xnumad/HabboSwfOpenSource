package com.sulake.habbo.communication.messages.incoming.users
{
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class _Str_5600 implements _Str_5716 
    {
        private var _Str_20748:int;
        private var _Str_7355:Array;
        private var _Str_8202:Array;

        public function _Str_5600(k:IMessageDataWrapper)
        {
            var _local_2:int;
            var _local_3:int;
            super();
            this._Str_20748 = k.readInteger();
            this._Str_7355 = new Array();
            _local_3 = k.readInteger();
            _local_2 = 0;
            while (_local_2 < _local_3)
            {
                this._Str_7355.push(new _Str_2866(k.readInteger(), k.readString(), k.readBoolean()));
                _local_2++;
            }
            _local_3 = k.readInteger();
            this._Str_8202 = new Array();
            _local_2 = 0;
            while (_local_2 < _local_3)
            {
                this._Str_8202.push(new _Str_5965(k));
                _local_2++;
            }
        }

        public function get _Str_23650():int
        {
            return this._Str_20748;
        }

        public function get _Str_6848():Array
        {
            return this._Str_7355;
        }

        public function get _Str_2811():Boolean
        {
            return false;
        }

        public function get _Str_3233():Boolean
        {
            return true;
        }

        public function get groupId():int
        {
            return 0;
        }

        public function get groupName():String
        {
            return "";
        }

        public function get _Str_17501():String
        {
            return "";
        }

        public function get baseRoomId():int
        {
            return 0;
        }

        public function get _Str_7342():int
        {
            return 0;
        }

        public function get _Str_7590():int
        {
            return 0;
        }

        public function get _Str_6089():Array
        {
            return this._Str_8202;
        }

        public function get locked():Boolean
        {
            return false;
        }

        public function get url():String
        {
            return "";
        }

        public function get _Str_4830():int
        {
            return 0;
        }

        public function get _Str_17566():int
        {
            return 0;
        }

        public function get badgeCode():String
        {
            return "";
        }

        public function get _Str_16539():int
        {
            return 0;
        }
    }
}
