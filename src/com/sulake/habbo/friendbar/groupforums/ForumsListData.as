package com.sulake.habbo.friendbar.groupforums
{
    import com.sulake.habbo.communication.messages.parser.groupforums._Str_5953;
    import com.sulake.habbo.communication.messages.parser.groupforums._Str_2807;

    public class ForumsListData 
    {
        private var _listCode:int;
        private var _totalAmount:int;
        private var _startIndex:int;
        private var _forums:Array;

        public function ForumsListData(k:_Str_5953)
        {
            this._listCode = k._Str_5154;
            this._totalAmount = k.totalAmount;
            this._startIndex = k.startIndex;
            this._forums = k.forums;
        }

        public function get _Str_5154():int
        {
            return this._listCode;
        }

        public function get totalAmount():int
        {
            return this._totalAmount;
        }

        public function get startIndex():int
        {
            return this._startIndex;
        }

        public function get forums():Array
        {
            return this._forums;
        }

        public function get _Str_9052():int
        {
            var _local_3:_Str_2807;
            var k:int;
            var _local_2:int;
            while (_local_2 < this._forums.length)
            {
                _local_3 = this._forums[_local_2];
                if (_local_3._Str_18237 > 0)
                {
                    k++;
                }
                _local_2++;
            }
            return k;
        }

        public function _Str_20077(k:int):_Str_2807
        {
            var _local_2:_Str_2807;
            for each (_local_2 in this._forums)
            {
                if (_local_2.groupId == k)
                {
                    return _local_2;
                }
            }
            return null;
        }

        public function _Str_20834(k:_Str_2807, _arg_2:int):void
        {
            var _local_3:_Str_2807 = this._Str_20077(k.groupId);
            if (_local_3 != null)
            {
                _local_3._Str_25309(k);
                _local_3._Str_12786 = _arg_2;
            }
        }
    }
}
