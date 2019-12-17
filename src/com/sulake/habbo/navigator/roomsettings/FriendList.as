package com.sulake.habbo.navigator.roomsettings
{
    import flash.utils.Dictionary;
    import com.sulake.habbo.communication.messages.incoming.friendlist.FriendParser;
    import com.sulake.habbo.communication.messages.incoming.friendlist._Str_3873;
    import com.sulake.habbo.communication.messages.parser.friendlist._Str_6720;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.incoming.friendlist._Str_4035;
    import com.sulake.habbo.communication.messages.parser.friendlist._Str_4925;

    public class FriendList 
    {
        private var _namesById:Dictionary;
        private var _list:Array;

        public function FriendList()
        {
            this._namesById = new Dictionary();
            super();
        }

        public function _Str_5276(k:IMessageEvent):void
        {
            var _local_3:FriendParser;
            var _local_2:_Str_6720 = (k as _Str_3873).getParser();
            if (_local_2 == null)
            {
                return;
            }
            for each (_local_3 in _local_2._Str_16756)
            {
                this._namesById[_local_3.id] = _local_3.name;
            }
        }

        public function _Str_4132(k:IMessageEvent):void
        {
            var _local_3:int;
            var _local_4:FriendParser;
            var _local_2:_Str_4925 = (k as _Str_4035).getParser();
            for each (_local_3 in _local_2._Str_12515)
            {
                this._namesById[_local_3] = null;
            }
            for each (_local_4 in _local_2._Str_14430)
            {
                this._namesById[_local_4.id] = _local_4.name;
            }
            this._list = (((_local_2._Str_12515.length > 0) || (_local_2._Str_14430.length > 0)) ? null : this._list);
        }

        public function get list():Array
        {
            var k:String;
            var _local_2:int;
            var _local_3:String;
            if (this._list == null)
            {
                this._list = new Array();
                for (k in this._namesById)
                {
                    _local_2 = int(k);
                    _local_3 = this._namesById[_local_2];
                    if (_local_3 != null)
                    {
                        this._list.push(new FriendEntryData(_local_2, _local_3));
                    }
                }
                this._list.sortOn("userName", Array.CASEINSENSITIVE);
            }
            return this._list;
        }
    }
}
