package com.sulake.habbo.communication.messages.parser.friendlist
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.habbo.communication.messages.incoming.friendlist._Str_5148;
    import com.sulake.habbo.communication.messages.incoming.friendlist.FriendParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class _Str_4925 implements IMessageParser 
    {
        private var _Str_16042:Array;
        private var _Str_17911:Array;
        private var _Str_17508:Array;
        private var _Str_18357:Array;


        public function flush():Boolean
        {
            this._Str_16042 = new Array();
            this._Str_17911 = new Array();
            this._Str_17508 = new Array();
            this._Str_18357 = new Array();
            return true;
        }

        public function parse(k:IMessageDataWrapper):Boolean
        {
            var _local_5:int;
            var _local_6:int;
            var _local_2:int = k.readInteger();
            var _local_3:int;
            while (_local_3 < _local_2)
            {
                this._Str_16042.push(new _Str_5148(k));
                _local_3++;
            }
            var _local_4:int = k.readInteger();
            _local_3 = 0;
            while (_local_3 < _local_4)
            {
                _local_5 = k.readInteger();
                if (_local_5 == -1)
                {
                    _local_6 = k.readInteger();
                    this._Str_17911.push(_local_6);
                }
                else
                {
                    if (_local_5 == 0)
                    {
                        this._Str_18357.push(new FriendParser(k));
                    }
                    else
                    {
                        if (_local_5 == 1)
                        {
                            this._Str_17508.push(new FriendParser(k));
                        }
                    }
                }
                _local_3++;
            }
            return true;
        }

        public function get _Str_22635():Array
        {
            return this._Str_16042;
        }

        public function get _Str_12515():Array
        {
            return this._Str_17911;
        }

        public function get _Str_14430():Array
        {
            return this._Str_17508;
        }

        public function get _Str_20668():Array
        {
            return this._Str_18357;
        }
    }
}
