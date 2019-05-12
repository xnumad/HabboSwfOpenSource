package com.sulake.habbo.avatar.common
{
    import com.sulake.core.utils.Map;
    import com.sulake.habbo.avatar.HabboAvatarEditor;
    import com.sulake.habbo.inventory.IHabboInventory;
    import com.sulake.core.window.IWindow;

    public class CategoryBaseModel implements IAvatarEditorCategoryModel 
    {
        protected var _Str_2382:Map;
        protected var _Str_2278:HabboAvatarEditor;
        protected var _Str_2367:Boolean = false;
        protected var _Str_2271:IAvatarEditorCategoryView;
        private var _disposed:Boolean;

        public function CategoryBaseModel(k:HabboAvatarEditor)
        {
            this._Str_2278 = k;
        }

        public function dispose():void
        {
            if (this._Str_2271 != null)
            {
                this._Str_2271.dispose();
            }
            this._Str_2271 = null;
            this._Str_2382 = null;
            this._Str_2278 = null;
            this._disposed = true;
        }

        public function get disposed():Boolean
        {
            return this._disposed;
        }

        protected function init():void
        {
            if (!this._Str_2382)
            {
                this._Str_2382 = new Map();
            }
        }

        public function reset():void
        {
            var k:CategoryData;
            this._Str_2367 = false;
            for each (k in this._Str_2382)
            {
                if (k)
                {
                    k.dispose();
                }
            }
            this._Str_2382 = new Map();
            if (this._Str_2271)
            {
                this._Str_2271.reset();
            }
        }

        protected function _Str_3130(k:String):void
        {
            var _local_3:CategoryData;
            var _local_2:CategoryData = this._Str_2382[k];
            if (_local_2 == null)
            {
                _local_3 = this._Str_2278._Str_24037(this, k);
                if (_local_3)
                {
                    this._Str_2382[k] = _local_3;
                    this.updateSelectionsFromFigure(k);
                }
            }
        }

        public function switchCategory(k:String=""):void
        {
            if (!this._Str_2367)
            {
                this.init();
            }
            if (this._Str_2271)
            {
                this._Str_2271.switchCategory(k);
            }
        }

        protected function updateSelectionsFromFigure(k:String):void
        {
            if ((((!(this._Str_2382)) || (!(this._Str_2278))) || (!(this._Str_2278.figureData))))
            {
                return;
            }
            var _local_2:CategoryData = this._Str_2382[k];
            if (_local_2 == null)
            {
                return;
            }
            var _local_3:int = this._Str_2278.figureData.getPartSetId(k);
            var _local_4:Array = this._Str_2278.figureData.getColourIds(k);
            if (!_local_4)
            {
                _local_4 = new Array();
            }
            _local_2._Str_20245(_local_3);
            _local_2._Str_17669(_local_4);
            if (this._Str_2271)
            {
                this._Str_2271._Str_5614(k, _local_4.length);
            }
        }

        public function _Str_20411(k:int):Boolean
        {
            var _local_2:CategoryData;
            var _local_3:Boolean;
            if (!this._Str_2382)
            {
                return false;
            }
            for each (_local_2 in this._Str_2382.getValues())
            {
                if (_local_2 != null)
                {
                    _local_3 = _local_2._Str_23352(k);
                    if (_local_3)
                    {
                        return true;
                    }
                }
            }
            return false;
        }

        public function _Str_7960(k:IHabboInventory):Boolean
        {
            var _local_2:CategoryData;
            var _local_3:Boolean;
            if (!this._Str_2382)
            {
                return false;
            }
            for each (_local_2 in this._Str_2382.getValues())
            {
                if (_local_2 != null)
                {
                    _local_3 = _local_2._Str_7960(k);
                    if (_local_3)
                    {
                        return true;
                    }
                }
            }
            return false;
        }

        public function _Str_15298(k:int):Boolean
        {
            var _local_5:String;
            var _local_6:CategoryData;
            var _local_7:Boolean;
            var _local_8:AvatarEditorGridPartItem;
            if (!this._Str_2382)
            {
                return false;
            }
            var _local_2:Array = this._Str_2382.getKeys();
            var _local_3:Boolean;
            var _local_4:int;
            while (_local_4 < _local_2.length)
            {
                _local_5 = _local_2[_local_4];
                _local_6 = this._Str_2382[_local_5];
                _local_7 = false;
                if (_local_6._Str_15298(k))
                {
                    _local_7 = true;
                }
                if (_local_6._Str_23810(k))
                {
                    _local_7 = true;
                }
                if (_local_7)
                {
                    _local_8 = _local_6._Str_6315();
                    if (((((_local_8) && (this._Str_2278)) && (this._Str_2278.figureData)) && (_local_6)))
                    {
                        this._Str_2278.figureData._Str_2088(_local_5, _local_8.id, _local_6._Str_11211(), true);
                    }
                    _local_3 = true;
                }
                _local_4++;
            }
            return _local_3;
        }

        public function _Str_8360():Boolean
        {
            var _local_4:String;
            var _local_5:CategoryData;
            var _local_6:Boolean;
            var _local_7:AvatarEditorGridPartItem;
            if (!this._Str_2382)
            {
                return false;
            }
            var k:Array = this._Str_2382.getKeys();
            var _local_2:Boolean;
            var _local_3:int;
            while (_local_3 < k.length)
            {
                _local_4 = k[_local_3];
                _local_5 = this._Str_2382[_local_4];
                _local_6 = false;
                if (_local_5._Str_8360(this._Str_2278.manager.inventory))
                {
                    _local_6 = true;
                }
                if (_local_6)
                {
                    _local_7 = _local_5._Str_6315();
                    if (((((_local_7) && (this._Str_2278)) && (this._Str_2278.figureData)) && (_local_5)))
                    {
                        this._Str_2278.figureData._Str_2088(_local_4, _local_7.id, _local_5._Str_11211(), true);
                    }
                    _local_2 = true;
                }
                _local_3++;
            }
            return _local_2;
        }

        public function selectPart(k:String, _arg_2:int):void
        {
            var _local_3:CategoryData = this._Str_2382[k];
            if (_local_3 == null)
            {
                return;
            }
            var _local_4:int = _local_3._Str_22359;
            _local_3._Str_8066(_arg_2);
            var _local_5:AvatarEditorGridPartItem = _local_3._Str_6315();
            if (!_local_5)
            {
                return;
            }
            if (_local_5._Str_14863)
            {
                _local_3._Str_8066(_local_4);
                this._Str_2278.openHabboClubAdWindow();
                return;
            }
            if (this._Str_2271)
            {
                this._Str_2271._Str_5614(k, _local_5._Str_17445);
            }
            if (((this._Str_2278) && (this._Str_2278.figureData)))
            {
                this._Str_2278.figureData._Str_2088(k, _local_5.id, _local_3._Str_11211(), true);
            }
        }

        public function selectColor(k:String, _arg_2:int, _arg_3:int):void
        {
            var _local_6:AvatarEditorGridColorItem;
            var _local_4:CategoryData = this._Str_2382[k];
            if (_local_4 == null)
            {
                return;
            }
            var _local_5:int = _local_4._Str_24480(_arg_3);
            _local_4._Str_17959(_arg_2, _arg_3);
            if (((this._Str_2278) && (this._Str_2278.figureData)))
            {
                _local_6 = _local_4._Str_13355(_arg_3);
                if (_local_6._Str_14863)
                {
                    _local_4._Str_17959(_local_5, _arg_3);
                    this._Str_2278.openHabboClubAdWindow();
                    return;
                }
                this._Str_2278.figureData.savePartSetColourId(k, _local_4._Str_11211(), true);
            }
        }

        public function get controller():HabboAvatarEditor
        {
            return this._Str_2278;
        }

        public function getWindowContainer():IWindow
        {
            if (!this._Str_2367)
            {
                this.init();
            }
            if (!this._Str_2271)
            {
                return null;
            }
            return this._Str_2271.getWindowContainer();
        }

        public function getCategoryData(k:String):CategoryData
        {
            if (!this._Str_2367)
            {
                this.init();
            }
            if (!this._Str_2382)
            {
                return null;
            }
            return this._Str_2382[k];
        }
    }
}
