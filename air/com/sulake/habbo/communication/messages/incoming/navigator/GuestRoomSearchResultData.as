//com.sulake.habbo.communication.messages.incoming.navigator.GuestRoomSearchResultData

package com.sulake.habbo.communication.messages.incoming.navigator{
    import com.sulake.core.runtime.IDisposable;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class GuestRoomSearchResultData implements IDisposable, MsgWithRequestId {

        private var _searchType:int;
        private var _searchParam:String;
        private var _rooms:Array;
        private var _ad:OfficialRoomEntryData;
        private var _disposed:Boolean;

        public function GuestRoomSearchResultData(k:IMessageDataWrapper):void;

        public function dispose():void;

        public function get disposed():Boolean;

        public function get searchType():int;

        public function get searchParam():String;

        public function get rooms():Array;

        public function get ad():OfficialRoomEntryData;


    }
}//package com.sulake.habbo.communication.messages.incoming.navigator

