package com.sulake.habbo.moderation
{
    import com.sulake.core.utils.Map;
    import com.sulake.habbo.communication.messages.parser.moderation._Str_2484;

    public class IssueBundle 
    {
        private var _id:int;
        private var _issues:Map;
        private var _state:int;
        private var _pickerUserId:int = 0;
        private var _pickerName:String = "";
        private var _reportedUserId:int;
        private var _groupingId:int;
        private var _messageCount:int = 0;
        private var _issueAgeInMilliseconds:int = 0;
        private var _oldestIssue:_Str_2484 = null;
        private var _highestPriorityIssue:_Str_2484 = null;

        public function IssueBundle(k:int, _arg_2:_Str_2484)
        {
            this._id = k;
            this._issues = new Map();
            this._state = _arg_2.state;
            this._pickerUserId = _arg_2._Str_5547;
            this._pickerName = _arg_2._Str_22164;
            this._reportedUserId = _arg_2._Str_2662;
            this._groupingId = _arg_2._Str_16842;
            this._Str_20388(_arg_2);
        }

        public function get id():int
        {
            return this._id;
        }

        public function get issues():Array
        {
            return this._issues.getValues();
        }

        public function get state():int
        {
            return this._state;
        }

        public function get _Str_5547():int
        {
            return this._pickerUserId;
        }

        public function get _Str_25343():String
        {
            return this._pickerName;
        }

        public function _Str_12152(k:_Str_2484, _arg_2:Boolean=false):Boolean
        {
            if (((this._groupingId == 0) || (k._Str_16842 == 0)))
            {
                return false;
            }
            if (((!(this._groupingId == k._Str_16842)) || (!(this._reportedUserId == k._Str_2662))))
            {
                return false;
            }
            if (!_arg_2)
            {
                if (this.state != k.state)
                {
                    return false;
                }
                if (this._Str_5547 != k._Str_5547)
                {
                    return false;
                }
            }
            return true;
        }

        public function contains(k:int):Boolean
        {
            if (this._issues == null)
            {
                return false;
            }
            return this._issues.getKeys().indexOf(k) > -1;
        }

        public function _Str_12118(k:_Str_2484):void
        {
            this._Str_11063(k._Str_2869);
            this._Str_20388(k);
        }

        private function _Str_20388(k:_Str_2484):void
        {
            this._issues.add(k._Str_2869, k);
            this._issueAgeInMilliseconds = k.issueAgeInMilliseconds;
            if (((!(k.message == null)) && (!(k.message == ""))))
            {
                this._messageCount++;
            }
            if (((this._oldestIssue == null) || (k.issueAgeInMilliseconds > this._oldestIssue.issueAgeInMilliseconds)))
            {
                this._oldestIssue = k;
            }
            this._highestPriorityIssue = null;
            this._Str_5216();
        }

        public function _Str_11063(k:int):_Str_2484
        {
            var _local_2:_Str_2484 = (this._issues.remove(k) as _Str_2484);
            if (_local_2 != null)
            {
                if (((!(_local_2.message == null)) && (!(_local_2.message == ""))))
                {
                    this._messageCount--;
                }
                if (this._oldestIssue == _local_2)
                {
                    this._oldestIssue = null;
                }
                if (this._highestPriorityIssue == _local_2)
                {
                    this._highestPriorityIssue = null;
                }
            }
            return _local_2;
        }

        public function get highestPriority():int
        {
            if (this._highestPriorityIssue == null)
            {
                this._Str_5216();
            }
            if (this._highestPriorityIssue != null)
            {
                return this._highestPriorityIssue.priority;
            }
            return 0;
        }

        public function _Str_5216():_Str_2484
        {
            var k:_Str_2484;
            var _local_2:_Str_2484;
            var _local_3:int;
            var _local_4:_Str_2484;
            var _local_5:Boolean;
            if (this._highestPriorityIssue == null)
            {
                if (((this._issues == null) || (this._issues.length < 1)))
                {
                    return null;
                }
                _local_3 = 0;
                while (_local_3 < this._issues.length)
                {
                    _local_4 = this._issues.getWithIndex(_local_3);
                    _local_5 = ((_local_4._Str_7437 > 0) && (_local_4._Str_7437 < 100));
                    if (_local_5)
                    {
                        if (((_local_2 == null) || (_local_2.priority > _local_4.priority)))
                        {
                            _local_2 = _local_4;
                        }
                    }
                    else
                    {
                        if (((k == null) || (k.priority > _local_4.priority)))
                        {
                            k = _local_4;
                        }
                    }
                    _local_3++;
                }
                if (_local_2 != null)
                {
                    this._highestPriorityIssue = _local_2;
                }
                else
                {
                    this._highestPriorityIssue = k;
                }
            }
            return this._highestPriorityIssue;
        }

        public function _Str_20055():int
        {
            if (this._issues == null)
            {
                return 0;
            }
            return this._issues.length;
        }

        public function _Str_7101():Array
        {
            if (this._issues == null)
            {
                return [];
            }
            return this._issues.getKeys();
        }

        public function get _Str_2662():int
        {
            return this._reportedUserId;
        }

        public function _Str_23420():int
        {
            return this._messageCount;
        }

        public function get issueAgeInMilliseconds():int
        {
            return this._issueAgeInMilliseconds;
        }

        public function _Str_15885(k:int):String
        {
            var _local_3:_Str_2484;
            var _local_2:_Str_2484 = this._oldestIssue;
            if (_local_2 == null)
            {
                for each (_local_3 in this._issues)
                {
                    if (((_local_2 == null) || (_local_3.issueAgeInMilliseconds > _local_2.issueAgeInMilliseconds)))
                    {
                        _local_2 = _local_3;
                    }
                }
                this._oldestIssue = _local_2;
            }
            if (_local_2 != null)
            {
                return _local_2._Str_15885(k);
            }
            return "";
        }
    }
}
