package com.sulake.habbo.groups.badge
{
    import com.sulake.habbo.groups.HabboGroupsManager;
    import com.sulake.core.window.IWindowContainer;
    import com.sulake.habbo.groups.ColorGridCtrl;
    import flash.display.BitmapData;
    import com.sulake.core.window.components.IBitmapWrapperWindow;
    import com.sulake.core.window.components.IButtonWindow;
    import com.sulake.core.window.components.IItemListWindow;
    import flash.geom.Point;
    import com.sulake.core.window.events.WindowMouseEvent;
    import com.sulake.core.window.events.WindowEvent;
    import com.sulake.core.window.IWindow;

    public class BadgeLayerCtrl 
    {
        public static var _Str_5392:int = 0;
        public static var _Str_17304:String = "part_edit_list";

        private var _manager:HabboGroupsManager;
        private var _parentCtrl:BadgeEditorCtrl;
        private var _layerIndex:int = 0;
        private var _layerOptions:BadgeLayerOptions;
        private var _layerWindow:IWindowContainer;
        private var _colorGridCtrl:ColorGridCtrl;
        private var _disposed:Boolean = false;
        private var _partAddBitmap:BitmapData;
        private var _partSelectImage:IBitmapWrapperWindow;
        private var _partSelectButton:IButtonWindow;
        private var _positionContainer:IWindowContainer;
        private var _positionPicker:IBitmapWrapperWindow;
        private var _positionGrid:IBitmapWrapperWindow;

        public function BadgeLayerCtrl(k:HabboGroupsManager, _arg_2:BadgeEditorCtrl, _arg_3:int)
        {
            this._manager = k;
            this._parentCtrl = _arg_2;
            this._layerIndex = _arg_3;
            this._layerOptions = new BadgeLayerOptions();
            this._layerOptions._Str_3617 = _arg_3;
            this._partAddBitmap = this._manager._Str_3122("badge_part_add");
        }

        public function createWindow():void
        {
            if (this._layerWindow != null)
            {
                return;
            }
            var k:IItemListWindow = (this._parentCtrl._Str_23796.findChildByName(_Str_17304) as IItemListWindow);
            this._layerWindow = (this._manager.getXmlWindow("badge_layer") as IWindowContainer);
            var _local_2:IWindowContainer = (this._layerWindow.findChildByName("preview_container") as IWindowContainer);
            this._partSelectImage = (_local_2.findChildByName("part_preview") as IBitmapWrapperWindow);
            this._partSelectImage.bitmap = this._manager._Str_3122("badge_part_add");
            this._partSelectButton = (_local_2.findChildByName("part_button") as IButtonWindow);
            this._partSelectButton.procedure = this._Str_24869;
            this._positionContainer = (this._layerWindow.findChildByName("position_container") as IWindowContainer);
            this._positionPicker = (this._positionContainer.findChildByName("position_picker") as IBitmapWrapperWindow);
            this._positionPicker.bitmap = this._manager._Str_3122("position_picker");
            this._positionGrid = (this._positionContainer.findChildByName("position_grid") as IBitmapWrapperWindow);
            this._positionGrid.bitmap = this._manager._Str_3122("position_grid");
            if (this._layerIndex == 0)
            {
                this._positionGrid.visible = false;
                this._positionPicker.visible = false;
            }
            else
            {
                this._positionGrid.procedure = this._Str_22712;
            }
            this._colorGridCtrl = new ColorGridCtrl(this._manager, this._Str_24879);
            this._colorGridCtrl._Str_16890(this._layerWindow, "color_selector", this._manager._Str_3058._Str_9008);
            if (this._layerOptions._Str_3617 == _Str_5392)
            {
                k.addListItem(this._layerWindow);
            }
            else
            {
                k.addListItemAt(this._layerWindow, 0);
            }
        }

        public function dispose():void
        {
            if (!this._disposed)
            {
                if (this._colorGridCtrl)
                {
                    this._colorGridCtrl.dispose();
                    this._colorGridCtrl = null;
                }
                if (this._layerWindow)
                {
                    this._layerWindow.dispose();
                    this._layerWindow = null;
                }
                this._partSelectImage = null;
                this._partSelectButton = null;
                this._positionContainer = null;
                this._positionPicker = null;
                this._positionGrid = null;
                this._manager = null;
                this._disposed = true;
            }
        }

        public function setLayerOptions(k:BadgeLayerOptions):void
        {
            if (k._Str_3617 != this._layerOptions._Str_3617)
            {
                throw (new Error("Tried to set layer option with invalid layerIndex value"));
            }
            var _local_2:Boolean;
            var _local_3:BadgeLayerOptions = this._layerOptions;
            this._layerOptions = k.clone();
            if (!this._layerOptions._Str_22335(_local_3))
            {
                this._Str_21129(false);
                _local_2 = true;
            }
            if (_local_3.colorIndex != this._layerOptions.colorIndex)
            {
                this._colorGridCtrl._Str_6965(this._layerOptions.colorIndex, false);
                this._layerOptions.colorIndex = this._colorGridCtrl._Str_4246;
                _local_2 = true;
            }
            if (((_local_2) || (!(_local_3._Str_3324 == this._layerOptions._Str_3324))))
            {
                this.updateSelectedPart();
            }
        }

        public function get layerOptions():BadgeLayerOptions
        {
            return this._layerOptions;
        }

        public function updateSelectedPart():void
        {
            var k:BitmapData;
            if (this._parentCtrl._Str_19999)
            {
                k = this._parentCtrl._Str_19999._Str_21949(this.layerOptions);
            }
            if (k == null)
            {
                k = this._partAddBitmap;
            }
            this._partSelectImage.bitmap.dispose();
            this._partSelectImage.bitmap = new BitmapData(k.width, k.height);
            this._partSelectImage.bitmap.copyPixels(k, k.rect, new Point());
            this._parentCtrl._Str_23517(this);
        }

        private function _Str_21129(k:Boolean=true):void
        {
            this._positionPicker.x = ((this._layerOptions._Str_7460 * 14) + 1);
            this._positionPicker.y = ((this._layerOptions._Str_8051 * 14) + 1);
            if (k)
            {
                this.updateSelectedPart();
            }
        }

        private function _Str_22712(k:WindowEvent, _arg_2:IWindow):void
        {
            if (((!(k.type == WindowMouseEvent.CLICK)) || (!(this._positionPicker))))
            {
                return;
            }
            var _local_3:WindowMouseEvent = (k as WindowMouseEvent);
            this._layerOptions._Str_7460 = Math.min(2, Math.max(0, Math.floor((_local_3.localX / 14))));
            this._layerOptions._Str_8051 = Math.min(2, Math.max(0, Math.floor((_local_3.localY / 14))));
            this._Str_21129();
        }

        private function _Str_24869(k:WindowEvent, _arg_2:IWindow):void
        {
            if (k.type != WindowMouseEvent.CLICK)
            {
                return;
            }
            this._parentCtrl._Str_24453(this);
        }

        public function _Str_24879(k:ColorGridCtrl):void
        {
            if (this._layerOptions.colorIndex != k._Str_4246)
            {
                this._layerOptions.colorIndex = k._Str_4246;
                this.updateSelectedPart();
            }
        }
    }
}
