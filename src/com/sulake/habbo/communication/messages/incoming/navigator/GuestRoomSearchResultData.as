package com.sulake.habbo.communication.messages.incoming.navigator
{
    import com.sulake.core.runtime.IDisposable;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class GuestRoomSearchResultData implements IDisposable, MsgWithRequestId
    {
        private var _searchType:int;
        private var _searchParam:String;
        private var _rooms:Array;
        private var _ad:OfficialRoomEntryData;
        private var _disposed:Boolean;

        public function GuestRoomSearchResultData(k:IMessageDataWrapper):void
        {
            this._rooms = new Array();
            super();
            this._searchType = k.readInteger();
            this._searchParam = k.readString();
            var _local_2:int = k.readInteger();
            var _local_3:int;
            while (_local_3 < _local_2)
            {
                this._rooms.push(new GuestRoomData(k));
                _local_3++;
            }
            var _local_4:Boolean = k.readBoolean();
            if (_local_4)
            {
                this._ad = new OfficialRoomEntryData(k);
            }
        }

        public function dispose():void
        {
            var k:GuestRoomData;
            if (this._disposed)
            {
                return;
            }
            this._disposed = true;
            if (this._rooms != null)
            {
                for each (k in this._rooms)
                {
                    k.dispose();
                }
            }
            if (this._ad != null)
            {
                this._ad.dispose();
                this._ad = null;
            }
            this._rooms = null;
        }

        public function get disposed():Boolean
        {
            return this._disposed;
        }

        public function get searchType():int
        {
            return this._searchType;
        }

        public function get _Str_25185():String
        {
            return this._searchParam;
        }

        public function get rooms():Array
        {
            return this._rooms;
        }

        public function get ad():OfficialRoomEntryData
        {
            return this._ad;
        }
    }
}
