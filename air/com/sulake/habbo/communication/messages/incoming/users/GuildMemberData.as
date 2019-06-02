//com.sulake.habbo.communication.messages.incoming.users.GuildMemberData

package com.sulake.habbo.communication.messages.incoming.users{
    import flash.utils.Dictionary;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class GuildMemberData {

        private var _groupId:int;
        private var _groupName:String;
        private var _baseRoomId:int;
        private var _badgeCode:String;
        private var _totalEntries:int;
        private var _entries:Array;
        private var _allowedToManage:Boolean;
        private var _pageSize:int;
        private var _pageIndex:int;
        private var _searchType:int;
        private var _userNameFilter:String;
        private var _usersById:Dictionary;

        public function GuildMemberData(k:IMessageDataWrapper);

        private static function removeFromArray(k:int, _arg_2:Array):void;


        public function get groupId():int;

        public function get groupName():String;

        public function get baseRoomId():int;

        public function get badgeCode():String;

        public function get totalEntries():int;

        public function get pageSize():int;

        public function get pageIndex():int;

        public function get searchType():int;

        public function get entries():Array;

        public function get allowedToManage():Boolean;

        public function get userNameFilter():String;

        public function get totalPages():int;

        public function update(k:MemberData):void;

        public function remove(k:int):void;

        public function getUser(k:int):MemberData;


    }
}//package com.sulake.habbo.communication.messages.incoming.users

