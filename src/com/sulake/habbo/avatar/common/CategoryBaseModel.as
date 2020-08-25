package com.sulake.habbo.avatar.common
{
    import com.sulake.core.utils.Map;
    import com.sulake.habbo.avatar.HabboAvatarEditor;
    import com.sulake.habbo.inventory.IHabboInventory;
    import com.sulake.core.window.IWindow;

    public class CategoryBaseModel implements IAvatarEditorCategoryModel 
    {
        protected var _categories:Map;
        protected var _controller:HabboAvatarEditor;
        protected var _isInitialized:Boolean = false;
        protected var _view:IAvatarEditorCategoryView;
        private var _disposed:Boolean;

        public function CategoryBaseModel(k:HabboAvatarEditor)
        {
            this._controller = k;
        }

        public function dispose():void
        {
            if (this._view != null)
            {
                this._view.dispose();
            }
            this._view = null;
            this._categories = null;
            this._controller = null;
            this._disposed = true;
        }

        public function get disposed():Boolean
        {
            return this._disposed;
        }

        protected function init():void
        {
            if (!this._categories)
            {
                this._categories = new Map();
            }
        }

        public function reset():void
        {
            var k:CategoryData;
            this._isInitialized = false;
            for each (k in this._categories)
            {
                if (k)
                {
                    k.dispose();
                }
            }
            this._categories = new Map();
            if (this._view)
            {
                this._view.reset();
            }
        }

        protected function _Str_3130(k:String):void
        {
            var _local_3:CategoryData;
            var _local_2:CategoryData = this._categories[k];
            if (_local_2 == null)
            {
                _local_3 = this._controller.generateDataContent(this, k);
                if (_local_3)
                {
                    this._categories[k] = _local_3;
                    this.updateSelectionsFromFigure(k);
                }
            }
        }

        public function switchCategory(k:String=""):void
        {
            if (!this._isInitialized)
            {
                this.init();
            }
            if (this._view)
            {
                this._view.switchCategory(k);
            }
        }

        protected function updateSelectionsFromFigure(k:String):void
        {
            if ((((!(this._categories)) || (!(this._controller))) || (!(this._controller.figureData))))
            {
                return;
            }
            var _local_2:CategoryData = this._categories[k];
            if (_local_2 == null)
            {
                return;
            }
            var _local_3:int = this._controller.figureData.getPartSetId(k);
            var _local_4:Array = this._controller.figureData.getColourIds(k);
            if (!_local_4)
            {
                _local_4 = new Array();
            }
            _local_2._Str_20245(_local_3);
            _local_2._Str_17669(_local_4);
            if (this._view)
            {
                this._view._Str_5614(k, _local_4.length);
            }
        }

        public function _Str_20411(k:int):Boolean
        {
            var _local_2:CategoryData;
            var _local_3:Boolean;
            if (!this._categories)
            {
                return false;
            }
            for each (_local_2 in this._categories.getValues())
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
            if (!this._categories)
            {
                return false;
            }
            for each (_local_2 in this._categories.getValues())
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
            if (!this._categories)
            {
                return false;
            }
            var _local_2:Array = this._categories.getKeys();
            var _local_3:Boolean;
            var _local_4:int;
            while (_local_4 < _local_2.length)
            {
                _local_5 = _local_2[_local_4];
                _local_6 = this._categories[_local_5];
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
                    if (((((_local_8) && (this._controller)) && (this._controller.figureData)) && (_local_6)))
                    {
                        this._controller.figureData._Str_2088(_local_5, _local_8.id, _local_6.getSelectedColorIds(), true);
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
            if (!this._categories)
            {
                return false;
            }
            var k:Array = this._categories.getKeys();
            var _local_2:Boolean;
            var _local_3:int;
            while (_local_3 < k.length)
            {
                _local_4 = k[_local_3];
                _local_5 = this._categories[_local_4];
                _local_6 = false;
                if (_local_5._Str_8360(this._controller.manager.inventory))
                {
                    _local_6 = true;
                }
                if (_local_6)
                {
                    _local_7 = _local_5._Str_6315();
                    if (((((_local_7) && (this._controller)) && (this._controller.figureData)) && (_local_5)))
                    {
                        this._controller.figureData._Str_2088(_local_4, _local_7.id, _local_5.getSelectedColorIds(), true);
                    }
                    _local_2 = true;
                }
                _local_3++;
            }
            return _local_2;
        }

        public function selectPart(k:String, _arg_2:int):void
        {
            var _local_3:CategoryData = this._categories[k];
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
                this._controller.openHabboClubAdWindow();
                return;
            }
            if (this._view)
            {
                this._view._Str_5614(k, _local_5._Str_17445);
            }
            if (((this._controller) && (this._controller.figureData)))
            {
                this._controller.figureData._Str_2088(k, _local_5.id, _local_3.getSelectedColorIds(), true);
            }
        }

        public function selectColor(k:String, _arg_2:int, _arg_3:int):void
        {
            var _local_6:AvatarEditorGridColorItem;
            var _local_4:CategoryData = this._categories[k];
            if (_local_4 == null)
            {
                return;
            }
            var _local_5:int = _local_4._Str_24480(_arg_3);
            _local_4._Str_17959(_arg_2, _arg_3);
            if (((this._controller) && (this._controller.figureData)))
            {
                _local_6 = _local_4.getSelectedColor(_arg_3);
                if (_local_6.isDisabledForWearing)
                {
                    _local_4._Str_17959(_local_5, _arg_3);
                    this._controller.openHabboClubAdWindow();
                    return;
                }
                this._controller.figureData.savePartSetColourId(k, _local_4.getSelectedColorIds(), true);
            }
        }

        public function get controller():HabboAvatarEditor
        {
            return this._controller;
        }

        public function getWindowContainer():IWindow
        {
            if (!this._isInitialized)
            {
                this.init();
            }
            if (!this._view)
            {
                return null;
            }
            return this._view.getWindowContainer();
        }

        public function getCategoryData(k:String):CategoryData
        {
            if (!this._isInitialized)
            {
                this.init();
            }
            if (!this._categories)
            {
                return null;
            }
            return this._categories[k];
        }
    }
}
