package com.sulake.habbo.avatar.common
{
    import com.sulake.core.window.IWindowContainer;
    import com.sulake.core.window.components.IItemGridWindow;
    import com.sulake.core.window.IWindow;
    import com.sulake.core.window.events.WindowMouseEvent;
    import com.sulake.core.window.components.IScrollableGridWindow;
    import com.sulake.core.window.events.WindowEvent;

    public class AvatarEditorGridView implements IAvatarEditorGridView 
    {
        public static const REMOVE_ITEM:String = "REMOVE_ITEM";
        public static const GET_MORE:String = "GET_MORE";

        private const _Str_6331:int = 2;

        private var _view:IWindowContainer;
        private var _model:IAvatarEditorCategoryModel;
        private var _partGrid:IItemGridWindow;
        private var _paletteGrids:Array;
        private var _categoryId:String;
        private var _notification:IWindow;
        private var _title:IWindow;

        public function AvatarEditorGridView(k:IWindowContainer)
        {
            this._view = k;
            this._partGrid = (this._view.findChildByName("thumbs") as IItemGridWindow);
            this._paletteGrids = [];
            this._paletteGrids.push((this._view.findChildByName("palette0") as IItemGridWindow));
            this._paletteGrids.push((this._view.findChildByName("palette1") as IItemGridWindow));
            this._notification = this._view.findChildByName("content_notification");
            this._title = this._view.findChildByName("content_title");
            this._notification.visible = false;
            this._title.visible = false;
        }

        public function dispose():void
        {
            var k:IItemGridWindow;
            if (this._partGrid)
            {
                this._partGrid.dispose();
                this._partGrid = null;
            }
            if (this._paletteGrids)
            {
                for each (k in this._paletteGrids)
                {
                    if (k != null)
                    {
                        k.dispose();
                        k = null;
                    }
                }
                this._paletteGrids = null;
            }
            this._model = null;
            if (this._view)
            {
                this._view.dispose();
                this._view = null;
            }
        }

        public function get window():IWindowContainer
        {
            if (this._view == null)
            {
                return null;
            }
            if (this._view.disposed)
            {
                return null;
            }
            return this._view;
        }

        public function initFromList(k:IAvatarEditorCategoryModel, _arg_2:String):void
        {
            var _local_4:IItemGridWindow;
            var _local_5:AvatarEditorGridPartItem;
            var _local_6:int;
            var _local_7:Array;
            var _local_8:AvatarEditorGridColorItem;
            var _local_3:CategoryData = k.getCategoryData(_arg_2);
            if (!_local_3)
            {
                return;
            }
            this._view.visible = true;
            this._model = k;
            this._categoryId = _arg_2;
            this._partGrid._Str_3956();
            if (_local_3.parts.length == 0)
            {
                this._title.visible = true;
                this._notification.visible = true;
            }
            else
            {
                this._title.visible = false;
                this._notification.visible = false;
                for each (_local_4 in this._paletteGrids)
                {
                    _local_4._Str_3956();
                }
                for each (_local_5 in _local_3.parts)
                {
                    if (_local_5)
                    {
                        this._partGrid._Str_2816(_local_5.view);
                        _local_5.view.addEventListener(WindowMouseEvent.CLICK, this._Str_22871);
                        if (_local_5._Str_2365)
                        {
                            this._Str_5614(_local_5._Str_17445);
                        }
                    }
                }
                _local_6 = 0;
                while (_local_6 < this._Str_6331)
                {
                    _local_7 = _local_3.getPalette(_local_6);
                    _local_4 = (this._paletteGrids[_local_6] as IItemGridWindow);
                    if (!((!(_local_7)) || (!(_local_4))))
                    {
                        for each (_local_8 in _local_7)
                        {
                            _local_4._Str_2816(_local_8.view);
                            _local_8.view.procedure = this._Str_25838;
                        }
                    }
                    _local_6++;
                }
            }
        }

        public function _Str_5614(k:int):void
        {
            var _local_2:IScrollableGridWindow = (this._view.findChildByName("palette0") as IScrollableGridWindow);
            var _local_3:IScrollableGridWindow = (this._view.findChildByName("palette1") as IScrollableGridWindow);
            var _local_4:int = this._partGrid.width;
            var _local_5:int = ((this._partGrid.width - 10) / 2);
            if (k <= 1)
            {
                _local_2.width = _local_4;
                _local_2.visible = true;
                _local_3.visible = false;
            }
            else
            {
                _local_2.width = _local_5;
                _local_3.width = _local_5;
                _local_3.x = (_local_2.right + 10);
                _local_2.visible = true;
                _local_3.visible = true;
            }
        }

        public function _Str_830(k:int, _arg_2:IWindowContainer):void
        {
            var _local_3:IWindow = this._partGrid._Str_2830(k);
            if (!_local_3)
            {
                return;
            }
            _local_3 = _arg_2;
        }

        private function _Str_22871(k:WindowMouseEvent):void
        {
            var _local_2:int;
            switch (k.target.name)
            {
                case REMOVE_ITEM:
                    _local_2 = this._partGrid._Str_3373(k.window);
                    this._model.selectPart(this._categoryId, _local_2);
                    return;
                case GET_MORE:
                    this._model.controller.manager.catalog.openCatalogPage(this._model.controller.manager.getProperty("catalog.clothes.page"));
                    return;
                default:
                    _local_2 = this._partGrid._Str_3373(k.window);
                    this._model.selectPart(this._categoryId, _local_2);
            }
        }

        private function _Str_25838(k:WindowEvent, _arg_2:IWindow):void
        {
            var _local_3:int;
            var _local_4:IItemGridWindow;
            var _local_5:int;
            var _local_6:IWindow;
            var _local_7:int;
            if (k.type == WindowMouseEvent.CLICK)
            {
                _local_6 = k.window;
                _local_7 = 0;
                while (_local_7 < this._Str_6331)
                {
                    if (this._paletteGrids.length > _local_7)
                    {
                        _local_4 = (this._paletteGrids[_local_7] as IItemGridWindow);
                        _local_5 = _local_4._Str_3373(_local_6);
                        if (_local_5 > -1)
                        {
                            this._model.selectColor(this._categoryId, _local_5, _local_7);
                            return;
                        }
                    }
                    _local_7++;
                }
            }
        }
    }
}

