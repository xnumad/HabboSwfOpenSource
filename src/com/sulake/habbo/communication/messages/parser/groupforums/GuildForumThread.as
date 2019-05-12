package com.sulake.habbo.communication.messages.parser.groupforums
{
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class GuildForumThread 
    {
        private var _threadId:int;
        private var _authorId:int;
        private var _authorName:String;
        private var _creationTime:int;
        private var _header:String;
        private var _totalMessages:int;
        private var _unreadMessagesCount:int;
        private var _Str_6301:int;
        private var _lastUserId:int;
        private var _lastUserName:String;
        private var _lastCommentTime:int;
        private var _state:int;
        private var _adminId:int;
        private var _adminName:String;
        private var _unknownInt:int;
        private var _isPinned:Boolean;
        private var _isLocked:Boolean;


        public static function parse(k:IMessageDataWrapper):GuildForumThread
        {
            var _local_2:GuildForumThread = new (GuildForumThread)();
            _local_2.threadId = k.readInteger();
            _local_2.authorId = k.readInteger();
            _local_2.authorName = k.readString();
            _local_2.header = k.readString();
            _local_2.isPinned = k.readBoolean();
            _local_2.isLocked = k.readBoolean();
            _local_2.creationTime = k.readInteger();
            _local_2.totalMessages = k.readInteger();
            _local_2.unreadMessagesCount = k.readInteger();
            _local_2._Str_10610 = k.readInteger();
            _local_2.lastUserId = k.readInteger();
            _local_2.lastUserName = k.readString();
            _local_2.lastCommentTime = k.readInteger();
            _local_2.state = k.readByte();
            _local_2.adminId = k.readInteger();
            _local_2.adminName = k.readString();
            _local_2.unknownInt = k.readInteger();
            return _local_2;
        }


        public function get unknownInt():int
        {
            return this._unknownInt;
        }

        public function set unknownInt(k:int):void
        {
            this._unknownInt = k;
        }

        public function get lastCommentTime():int
        {
            return this._lastCommentTime;
        }

        public function set lastCommentTime(k:int):void
        {
            this._lastCommentTime = k;
        }

        public function get threadId():int
        {
            return this._threadId;
        }

        public function set threadId(k:int):void
        {
            this._threadId = k;
        }

        public function get authorId():int
        {
            return this._authorId;
        }

        public function set authorId(k:int):void
        {
            this._authorId = k;
        }

        public function get authorName():String
        {
            return this._authorName;
        }

        public function set authorName(k:String):void
        {
            this._authorName = k;
        }

        public function get creationTime():int
        {
            return this._creationTime;
        }

        public function set creationTime(k:int):void
        {
            this._creationTime = k;
        }

        public function get header():String
        {
            return this._header;
        }

        public function set header(k:String):void
        {
            this._header = k;
        }

        public function get _Str_10610():int
        {
            return this._Str_6301;
        }

        public function set _Str_10610(k:int):void
        {
            this._Str_6301 = k;
        }

        public function get lastUserId():int
        {
            return this._lastUserId;
        }

        public function set lastUserId(k:int):void
        {
            this._lastUserId = k;
        }

        public function get lastUserName():String
        {
            return this._lastUserName;
        }

        public function set lastUserName(k:String):void
        {
            this._lastUserName = k;
        }

        public function get totalMessages():int
        {
            return this._totalMessages;
        }

        public function set totalMessages(k:int):void
        {
            this._totalMessages = k;
        }

        public function get unreadMessagesCount():int
        {
            return this._unreadMessagesCount;
        }

        public function set unreadMessagesCount(k:int):void
        {
            this._unreadMessagesCount = k;
        }

        public function get state():int
        {
            return this._state;
        }

        public function set state(k:int):void
        {
            this._state = k;
        }

        public function get adminId():int
        {
            return this._adminId;
        }

        public function set adminId(k:int):void
        {
            this._adminId = k;
        }

        public function get adminName():String
        {
            return this._adminName;
        }

        public function set adminName(k:String):void
        {
            this._adminName = k;
        }

        public function get isPinned():Boolean
        {
            return this._isPinned;
        }

        public function set isPinned(k:Boolean):void
        {
            this._isPinned = k;
        }

        public function get isLocked():Boolean
        {
            return this._isLocked;
        }

        public function set isLocked(k:Boolean):void
        {
            this._isLocked = k;
        }
    }
}
