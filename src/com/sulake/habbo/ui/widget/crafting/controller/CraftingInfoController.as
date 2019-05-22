package com.sulake.habbo.ui.widget.crafting.controller
{
    import com.sulake.habbo.room.IGetImageListener;
    import com.sulake.habbo.ui.widget.crafting.CraftingWidget;
    import __AS3__.vec.Vector;
    import com.sulake.habbo.session.furniture.IFurnitureData;
    import com.sulake.core.window.components.ITextWindow;
    import com.sulake.habbo.localization.IHabboLocalizationManager;
    import com.sulake.habbo.ui.widget.crafting.utils.CraftingViewStateEnum;
    import com.sulake.core.window.components.IButtonWindow;
    import com.sulake.core.window.events.WindowMouseEvent;
    import com.sulake.core.window.events.WindowEvent;
    import com.sulake.core.window.IWindow;
    import com.sulake.habbo.room.ImageResult;
    import com.sulake.habbo.catalog.enum.ProductTypeEnum;
    import flash.display.BitmapData;
    import com.sulake.core.window.components.IBitmapWrapperWindow;
    import com.sulake.core.window.IWindowContainer;
    import __AS3__.vec.*;

    public class CraftingInfoController implements IGetImageListener 
    {
        private static const _Str_19505:Boolean = false;

        private var _widget:CraftingWidget;
        private var _progressBar:CraftingProgressBarController;

        public function CraftingInfoController(k:CraftingWidget)
        {
            this._widget = k;
            this._progressBar = new CraftingProgressBarController(k);
        }

        public function dispose():void
        {
            this._widget = null;
            if (this._progressBar)
            {
                this._progressBar.dispose();
                this._progressBar = null;
            }
        }

        public function setState(k:int, ... _args):void
        {
            var _local_5:int;
            var _local_6:Vector.<String>;
            var _local_7:Array;
            var _local_8:IFurnitureData;
            var _local_10:ITextWindow;
            var _local_3:String = "";
            var _local_4:String = "";
            if ((((_args is Array) && (_args.length)) && (_args[0] is Array)))
            {
                _local_7 = _args[0];
            }
            else
            {
                _local_7 = _args;
            }
            var _local_9:IHabboLocalizationManager = this._widget.handler.container.localization;
            switch (k)
            {
                case CraftingViewStateEnum._Str_15900:
                    _local_3 = "${crafting.info.start}";
                    this._Str_6691(false);
                    break;
                case CraftingViewStateEnum._Str_8764:
                    this._Str_9627();
                    _local_3 = "${crafting.info.mixer.empty}";
                    this._Str_15106("${crafting.status.mixer.notavailable}");
                    break;
                case CraftingViewStateEnum._Str_13644:
                    this._Str_9627();
                    _local_3 = "${crafting.info.product.empty}";
                    this._Str_6691(false);
                    break;
                case CraftingViewStateEnum._Str_15210:
                    this._Str_9627();
                    _local_3 = "${crafting.info.mixer.hit}";
                    this._Str_8735();
                    break;
                case CraftingViewStateEnum._Str_13163:
                    this._Str_9627();
                    _local_5 = (_local_7[0] as int);
                    _local_3 = _local_9.getLocalization("crafting.info.mixer.hit.plus.others", "crafting.info.mixer.hit.plus.others");
                    _local_3 = _local_3.replace("%number%", _local_5);
                    this._Str_8735();
                    break;
                case CraftingViewStateEnum._Str_15076:
                    this._Str_9627();
                    _local_5 = (_local_7[0] as int);
                    _local_3 = _local_9.getLocalization("crafting.info.mixer.others");
                    _local_3 = _local_3.replace("%number%", _local_5);
                    this._Str_15106("${crafting.status.mixer.notavailable}");
                    break;
                case CraftingViewStateEnum._Str_12563:
                    this._Str_9627();
                    _local_3 = "${crafting.info.mixer.nohit}";
                    this._Str_15106("${crafting.status.mixer.notavailable}");
                    break;
                case CraftingViewStateEnum._Str_15345:
                    _local_8 = (_local_7[0] as IFurnitureData);
                    if (!_local_8)
                    {
                        return;
                    }
                    this._Str_6402(_local_8);
                    _local_3 = _local_9.getLocalization("crafting.info.product.complete", "crafting.info.product.complete");
                    _local_4 = _local_8.localizedName;
                    this._Str_8735();
                    break;
                case CraftingViewStateEnum._Str_9812:
                    _local_8 = (_local_7[0] as IFurnitureData);
                    if (!_local_8)
                    {
                        return;
                    }
                    this._Str_6402(_local_8);
                    _local_6 = (_local_7[1] as Vector.<String>);
                    _local_3 = _local_9.getLocalization("crafting.info.product.incomplete", "crafting.info.product.incomplete");
                    _local_4 = _local_8.localizedName;
                    this._Str_15106("${crafting.status.recipe.incomplete}");
                    break;
                case CraftingViewStateEnum._Str_15827:
                    _local_8 = (_local_7[0] as IFurnitureData);
                    if (!_local_8)
                    {
                        return;
                    }
                    this._Str_6402(_local_8);
                    _local_3 = _local_9.getLocalization("crafting.info.mixer.notininventory", "crafting.info.mixer.notininventory");
                    _local_3 = _local_3.replace("%product%", _local_8.localizedName);
                    break;
                case CraftingViewStateEnum._Str_13842:
                    _local_8 = (_local_7[0] as IFurnitureData);
                    if (!_local_8)
                    {
                        return;
                    }
                    this._Str_6402(_local_8);
                    _local_3 = _local_9.getLocalization("crafting.info.result.ok", "crafting.info.result.ok");
                    _local_4 = _local_8.localizedName;
                    this._Str_6691(false);
                    break;
                case CraftingViewStateEnum._Str_9671:
                    _local_3 = "${crafting.info.working}";
                    this._Str_6691(false);
                    break;
            }
            _local_10 = (this.mainWindow.findChildByName("info_text1") as ITextWindow);
            if (_local_10)
            {
                _local_10.text = _local_3;
            }
            _local_10 = (this.mainWindow.findChildByName("info_text2") as ITextWindow);
            if (_local_10)
            {
                _local_10.text = _local_4;
            }
        }

        private function _Str_8735():void
        {
            this._Str_6691(true);
            var k:IButtonWindow = ((this.mainWindow) ? (this.mainWindow.findChildByName("btn_craft") as IButtonWindow) : null);
            if (this._widget.handler._Str_3233)
            {
                k.caption = "${crafting.btn.craft}";
                k.enable();
                k.procedure = this._Str_25448;
            }
            else
            {
                k.caption = "${crafting.btn.notowner}";
                k.disable();
            }
        }

        private function _Str_15106(k:String):void
        {
            this._Str_6691(true);
            var _local_2:IButtonWindow = ((this.mainWindow) ? (this.mainWindow.findChildByName("btn_craft") as IButtonWindow) : null);
            if (this._widget.handler._Str_3233)
            {
                _local_2.caption = k;
            }
            else
            {
                _local_2.caption = "${crafting.btn.notowner}";
            }
            _local_2.disable();
        }

        public function _Str_25724(k:int, _arg_2:Boolean):void
        {
            if (_arg_2)
            {
                if (k == 0)
                {
                    this.setState(CraftingViewStateEnum._Str_15210);
                }
                else
                {
                    this.setState(CraftingViewStateEnum._Str_13163, k);
                }
            }
            else
            {
                if (k > 0)
                {
                    this.setState(CraftingViewStateEnum._Str_15076, k);
                }
                else
                {
                    this.setState(CraftingViewStateEnum._Str_12563);
                }
            }
        }

        private function _Str_25448(k:WindowEvent, _arg_2:IWindow):void
        {
            if (k.type != WindowMouseEvent.DOWN)
            {
                return;
            }
            this._Str_23676();
        }

        private function _Str_9627():void
        {
            this._Str_18264(null);
            this._Str_17514();
        }

        private function _Str_6402(k:IFurnitureData):void
        {
            var _local_2:ImageResult;
            switch (k.type)
            {
                case ProductTypeEnum.FLOOR:
                    _local_2 = this._widget.handler.container.roomEngine.getFurnitureIcon(k.id, this);
                    break;
                case ProductTypeEnum.WALL:
                    _local_2 = this._widget.handler.container.roomEngine.getWallItemIcon(k.id, this);
                    break;
            }
            if (_local_2.data)
            {
                this.imageReady(0, _local_2.data);
            }
        }

        public function imageReady(k:int, _arg_2:BitmapData):void
        {
            this._Str_18264(_arg_2);
            this._Str_17514();
        }

        public function imageFailed(k:int):void
        {
            this._Str_18264(null);
            this._Str_17514();
        }

        private function _Str_17514():void
        {
        }

        private function _Str_23676():void
        {
            this._widget.handler.craftingInProgress = true;
            this._Str_6691(false);
            this._progressBar.show();
        }

        public function _Str_19691():void
        {
            this._widget.handler.craftingInProgress = false;
            this._progressBar.hide();
            this._Str_6691(true);
        }

        public function _Str_25541():void
        {
            this._progressBar.hide();
            this._widget._Str_24348();
        }

        private function _Str_18264(k:BitmapData):void
        {
            var _local_2:IBitmapWrapperWindow = ((this.mainWindow) ? IBitmapWrapperWindow(this.mainWindow.findChildByName("furniture_icon")) : null);
            if (!_local_2)
            {
                return;
            }
            _local_2.bitmap = k;
        }

        private function _Str_6691(k:Boolean):void
        {
            var _local_2:IWindow = ((this.mainWindow) ? this.mainWindow.findChildByName("btn_craft") : null);
            if (_local_2)
            {
                _local_2.visible = k;
            }
        }

        public function get mainWindow():IWindowContainer
        {
            return this._widget.window;
        }
    }
}
