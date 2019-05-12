package com.sulake.habbo.friendbar.groupforums
{
    import flash.utils.Dictionary;
    import com.sulake.habbo.communication.messages.parser.groupforums.GuildForumThread;

    public class ThreadsListData 
    {
        public static const _Str_3331:int = 20;

        private var _totalThreads:int;
        private var _startIndex:int;
        private var _threads:Array;
        private var _threadsById:Dictionary;

        public function ThreadsListData(k:int, _arg_2:int, _arg_3:Array)
        {
            var _local_5:GuildForumThread;
            super();
            this._totalThreads = k;
            this._startIndex = _arg_2;
            this._threads = _arg_3;
            this._threadsById = new Dictionary();
            var _local_4:int;
            while (_local_4 < _arg_3.length)
            {
                _local_5 = _arg_3[_local_4];
                this._threadsById[_local_5.threadId] = _local_5;
                _local_4++;
            }
        }

        public function get _Str_18760():int
        {
            return this._totalThreads;
        }

        public function get startIndex():int
        {
            return this._startIndex;
        }

        public function get _Str_8372():Array
        {
            return this._threads;
        }

        public function get _Str_6700():Dictionary
        {
            return this._threadsById;
        }

        public function get size():int
        {
            return this._threads.length;
        }

        public function _Str_16120(k:GuildForumThread):Boolean
        {
            var _local_3:GuildForumThread;
            this._Str_6700[k.threadId] = k;
            var _local_2:int;
            while (_local_2 < this._Str_8372.length)
            {
                _local_3 = this._Str_8372[_local_2];
                if (_local_3.threadId == k.threadId)
                {
                    this._Str_8372[_local_2] = k;
                    return true;
                }
                _local_2++;
            }
            return false;
        }
    }
}
