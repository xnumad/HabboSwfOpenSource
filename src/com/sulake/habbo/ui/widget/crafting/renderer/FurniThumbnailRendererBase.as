package com.sulake.habbo.ui.widget.crafting.renderer
{
    import com.sulake.habbo.room.IGetImageListener;
    import com.sulake.habbo.ui.widget.crafting.CraftingWidget;
    import com.sulake.habbo.ui.widget.crafting.utils.CraftingFurnitureItem;
    import com.sulake.core.window.IWindowContainer;
    import com.sulake.core.window.components.IRegionWindow;
    import flash.events.MouseEvent;
    import com.sulake.habbo.room.ImageResult;
    import com.sulake.habbo.catalog.enum.ProductTypeEnum;
    import com.sulake.habbo.session.furniture.IFurnitureData;
    import com.sulake.core.window.components.IBitmapWrapperWindow;
    import flash.display.BitmapData;
    import com.sulake.core.window.IWindow;
    import com.sulake.core.window.components.ITextWindow;
    import com.sulake.core.window.events.WindowMouseEvent;
    import com.sulake.core.window.events.WindowEvent;

    public class FurniThumbnailRendererBase implements IGetImageListener 
    {
        private const _Str_18094:Number = 1;
        private const _Str_18535:Number = 0.2;

        protected var _Str_2268:CraftingWidget;
        protected var _data:CraftingFurnitureItem;
        protected var _window:IWindowContainer;

        public function FurniThumbnailRendererBase(k:CraftingFurnitureItem, _arg_2:IWindowContainer, _arg_3:CraftingWidget)
        {
            this._Str_2268 = _arg_3;
            this._window = _arg_2;
            this._data = k;
            this._Str_6402(this.furnitureData);
            this.updateItemCount();
            this._window.procedure = this._Str_780;
            var _local_4:IRegionWindow = (_arg_2.findChildByName("tooltip") as IRegionWindow);
            _local_4._Str_2613 = k.furnitureData.localizedName;
        }

        public function dispose():void
        {
            if (this._window)
            {
                this._window.removeEventListener(MouseEvent.MOUSE_DOWN, this._Str_780);
                this._window.dispose();
                this._window = null;
            }
        }

        private function _Str_6402(k:IFurnitureData):void
        {
            var _local_2:ImageResult;
            switch (k.type)
            {
                case ProductTypeEnum.FLOOR:
                    _local_2 = this._Str_2268.handler.container.roomEngine.getFurnitureIcon(k.id, this);
                    break;
                case ProductTypeEnum.WALL:
                    _local_2 = this._Str_2268.handler.container.roomEngine.getWallItemIcon(k.id, this);
                    break;
            }
            if (_local_2.data)
            {
                this.imageReady(0, _local_2.data);
            }
        }

        public function imageReady(k:int, _arg_2:BitmapData):void
        {
            if (!this._window)
            {
                return;
            }
            var _local_3:IBitmapWrapperWindow = (this._window.findChildByTag("BITMAP") as IBitmapWrapperWindow);
            if (((_local_3) && (_arg_2)))
            {
                _local_3.bitmap = _arg_2;
            }
        }

        public function imageFailed(k:int):void
        {
        }

        public function updateItemCount():void
        {
        }

        protected function _Str_22233():void
        {
            var k:IWindow = this._window.findChildByName("number_container");
            if (k)
            {
                k.visible = false;
            }
        }

        protected function _Str_21081(k:int):void
        {
            var _local_3:ITextWindow;
            if (((!(this._window)) || (this._window.disposed)))
            {
                return;
            }
            var _local_2:IWindow = this._window.findChildByName("number_container");
            _local_2.visible = (k > 0);
            if (k > 0)
            {
                _local_3 = (this._window.findChildByName("number") as ITextWindow);
                _local_3.text = String(k);
            }
        }

        protected function _Str_14878(k:Boolean):void
        {
            var _local_2:IBitmapWrapperWindow = (this._window.findChildByName("bitmap") as IBitmapWrapperWindow);
            if (k)
            {
                _local_2.blend = this._Str_18094;
            }
            else
            {
                _local_2.blend = this._Str_18535;
            }
        }

        private function _Str_780(k:WindowEvent, _arg_2:IWindow):void
        {
            if (k.type != WindowMouseEvent.DOWN)
            {
                return;
            }
            this.onTriggered();
        }

        protected function onTriggered():void
        {
        }

        public function get content():CraftingFurnitureItem
        {
            return this._data;
        }

        protected function get furnitureData():IFurnitureData
        {
            return (this.content) ? this.content.furnitureData : null;
        }

        public function get window():IWindowContainer
        {
            return this._window;
        }
    }
}
