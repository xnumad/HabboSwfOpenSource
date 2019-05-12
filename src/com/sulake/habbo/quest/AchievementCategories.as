package com.sulake.habbo.quest
{
    import flash.utils.Dictionary;
    import __AS3__.vec.Vector;
    import com.sulake.habbo.communication.messages.incoming.inventory.achievements.Achievement;
    import __AS3__.vec.*;

    public class AchievementCategories 
    {
        private var _categoryMap:Dictionary;
        private var _categoryList:Vector.<AchievementCategory>;

        public function AchievementCategories(k:Array)
        {
            var _local_2:AchievementCategory;
            var _local_3:Achievement;
            var _local_4:AchievementCategory;
            this._categoryMap = new Dictionary();
            this._categoryList = new Vector.<AchievementCategory>(0);
            super();
            for each (_local_3 in k)
            {
                if (_local_3.category == "")
                {
                }
                else
                {
                    _local_4 = this._categoryMap[_local_3.category];
                    if (_local_4 == null)
                    {
                        _local_4 = new AchievementCategory(_local_3.category);
                        this._categoryMap[_local_3.category] = _local_4;
                        if (_local_3.category != "misc")
                        {
                            this._categoryList.push(_local_4);
                        }
                        else
                        {
                            _local_2 = _local_4;
                        }
                    }
                    _local_4.add(_local_3);
                }
            }
            if (_local_2 != null)
            {
                this._categoryList.push(_local_2);
            }
        }

        public function update(k:Achievement):void
        {
            if (k.category == "")
            {
                return;
            }
            var _local_2:AchievementCategory = this._categoryMap[k.category];
            _local_2.update(k);
        }

        public function get _Str_16947():Vector.<AchievementCategory>
        {
            return this._categoryList;
        }

        public function _Str_10932():int
        {
            var _local_2:AchievementCategory;
            var k:int;
            for each (_local_2 in this._categoryList)
            {
                k = (k + _local_2._Str_10932());
            }
            return k;
        }

        public function _Str_9594():int
        {
            var _local_2:AchievementCategory;
            var k:int;
            for each (_local_2 in this._categoryList)
            {
                k = (k + _local_2._Str_9594());
            }
            return k;
        }

        public function _Str_16342(k:String):AchievementCategory
        {
            var _local_2:AchievementCategory;
            for each (_local_2 in this._categoryList)
            {
                if (_local_2.code == k)
                {
                    return _local_2;
                }
            }
            return null;
        }
    }
}
