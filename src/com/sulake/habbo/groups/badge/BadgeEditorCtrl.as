package com.sulake.habbo.groups.badge
{
    import com.sulake.core.runtime.IDisposable;
    import com.sulake.habbo.groups.HabboGroupsManager;
    import com.sulake.core.window.IWindowContainer;
    import __AS3__.vec.Vector;
    import com.sulake.core.window.components.IItemGridWindow;
    import com.sulake.core.window.components.IBitmapWrapperWindow;
    import com.sulake.habbo.groups.events.HabboGroupsEditorData;
    import com.sulake.habbo.communication.messages.incoming.users._Str_5965;
    import flash.display.BitmapData;
    import flash.geom.Point;
    import __AS3__.vec.*;
    import com.sulake.habbo.groups.*;

    public class BadgeEditorCtrl implements IDisposable 
    {
        private var _manager:HabboGroupsManager;
        private var _window:IWindowContainer;
        private var _parentWindow:IWindowContainer;
        private var _badgeInitData:Array;
        private var _badgeSelectPartCtrl:BadgeSelectPartCtrl;
        private var _disposed:Boolean = false;
        private var _layers:Vector.<BadgeLayerCtrl>;
        private var _currentLayerOptions:BadgeLayerOptions;
        private var _partSelectContainer:IWindowContainer;
        private var _partSelectGrid:IItemGridWindow;
        private var _partEditContainer:IWindowContainer;
        private var _badgePreviewImages:Vector.<IBitmapWrapperWindow>;

        public function BadgeEditorCtrl(k:HabboGroupsManager)
        {
            this._manager = k;
            this._manager.events.addEventListener(HabboGroupsEditorData.HGE_EDIT_INFO, this._Str_23748);
            this._badgeSelectPartCtrl = new BadgeSelectPartCtrl(this._manager, this);
            this._layers = new Vector.<BadgeLayerCtrl>();
            this._layers.push(new BadgeLayerCtrl(this._manager, this, 0));
            this._layers.push(new BadgeLayerCtrl(this._manager, this, 1));
            this._layers.push(new BadgeLayerCtrl(this._manager, this, 2));
            this._layers.push(new BadgeLayerCtrl(this._manager, this, 3));
            this._layers.push(new BadgeLayerCtrl(this._manager, this, 4));
        }

        public function get disposed():Boolean
        {
            return this._disposed;
        }

        public function get _Str_23796():IWindowContainer
        {
            return this._partEditContainer;
        }

        public function get _Str_20634():IWindowContainer
        {
            return this._partSelectContainer;
        }

        public function get _Str_5636():IItemGridWindow
        {
            return this._partSelectGrid;
        }

        public function get _Str_21658():BadgeLayerOptions
        {
            return this._currentLayerOptions;
        }

        public function get _Str_19999():BadgeSelectPartCtrl
        {
            return this._badgeSelectPartCtrl;
        }

        public function get _Str_6443():Boolean
        {
            return (!(this._window == null)) && (!(this._badgeInitData == null));
        }

        public function dispose():void
        {
            var k:BadgeLayerCtrl;
            var _local_2:IBitmapWrapperWindow;
            if (!this._disposed)
            {
                if (this._layers)
                {
                    for each (k in this._layers)
                    {
                        k.dispose();
                    }
                    this._layers = null;
                }
                if (this._badgeSelectPartCtrl)
                {
                    this._badgeSelectPartCtrl.dispose();
                    this._badgeSelectPartCtrl = null;
                }
                if (this._partSelectContainer)
                {
                    this._partSelectContainer.dispose();
                    this._partSelectContainer = null;
                }
                if (this._partSelectGrid)
                {
                    this._partSelectGrid.dispose();
                    this._partSelectGrid = null;
                }
                if (this._partEditContainer)
                {
                    this._partEditContainer.dispose();
                    this._partEditContainer = null;
                }
                if (this._badgePreviewImages)
                {
                    for each (_local_2 in this._badgePreviewImages)
                    {
                        _local_2.dispose();
                    }
                    this._badgePreviewImages = null;
                }
                if (this._window)
                {
                    this._window.dispose();
                    this._window = null;
                }
                this._badgeInitData = null;
                this._currentLayerOptions = null;
                this._window = null;
                this._manager = null;
                this._disposed = true;
            }
        }

        public function _Str_23748(k:HabboGroupsEditorData):void
        {
            this._badgeSelectPartCtrl.loadData();
            this.createWindow(null, null);
        }

        public function createWindow(k:IWindowContainer, _arg_2:Array):void
        {
            if (((!(this._window == null)) || (this._disposed)))
            {
                return;
            }
            if (k != null)
            {
                this._parentWindow = k;
            }
            if (_arg_2 != null)
            {
                this._badgeInitData = _arg_2;
            }
            if (((((this._parentWindow == null) || (this._badgeInitData == null)) || (this._manager == null)) || (this._manager._Str_3058 == null)))
            {
                return;
            }
            this._window = (this._manager.getXmlWindow("badge_editor") as IWindowContainer);
            var _local_3:IWindowContainer = (this._window.findChildByName("guild_badge") as IWindowContainer);
            this._badgePreviewImages = new Vector.<IBitmapWrapperWindow>();
            this._badgePreviewImages.push((_local_3.findChildByName("layer_0") as IBitmapWrapperWindow));
            this._badgePreviewImages.push((_local_3.findChildByName("layer_1") as IBitmapWrapperWindow));
            this._badgePreviewImages.push((_local_3.findChildByName("layer_2") as IBitmapWrapperWindow));
            this._badgePreviewImages.push((_local_3.findChildByName("layer_3") as IBitmapWrapperWindow));
            this._badgePreviewImages.push((_local_3.findChildByName("layer_4") as IBitmapWrapperWindow));
            this._partEditContainer = (this._window.findChildByName("part_edit") as IWindowContainer);
            this._partSelectContainer = (this._window.findChildByName("part_select") as IWindowContainer);
            this._partSelectContainer.visible = false;
            this._partSelectGrid = (this._partSelectContainer.findChildByName("part_select_grid") as IItemGridWindow);
            var _local_4:int;
            while (_local_4 < this._layers.length)
            {
                this._layers[_local_4].createWindow();
                _local_4++;
            }
            this._Str_15567(this._badgeInitData);
            this._parentWindow.addChild(this._window);
        }

        public function _Str_15567(k:Array):void
        {
            if (!this._Str_6443)
            {
                return;
            }
            if (this._partSelectContainer.visible)
            {
                this._partSelectContainer.visible = false;
                this._partEditContainer.visible = true;
            }
            this._badgeInitData = k;
            this._currentLayerOptions = null;
            this._partEditContainer.visible = true;
            this._partSelectContainer.visible = false;
            this._badgeSelectPartCtrl.loadData();
            var _local_2:int;
            while (_local_2 < this._layers.length)
            {
                this._layers[_local_2].setLayerOptions(this._Str_23257(_local_2));
                this._layers[_local_2].updateSelectedPart();
                _local_2++;
            }
        }

        private function _Str_23257(k:int):BadgeLayerOptions
        {
            var _local_2:int;
            var _local_3:_Str_5965 = (this._badgeInitData[k] as _Str_5965);
            var _local_4:BadgeLayerOptions = new BadgeLayerOptions();
            _local_4._Str_3617 = k;
            _local_4.colorIndex = 0;
            _local_4._Str_25730(_local_3.position);
            _local_2 = 0;
            while (_local_2 < this._manager._Str_3058._Str_9008.length)
            {
                if (this._manager._Str_3058._Str_9008[_local_2].id == _local_3._Str_25271)
                {
                    _local_4.colorIndex = _local_2;
                    break;
                }
                _local_2++;
            }
            if (k == BadgeLayerCtrl._Str_5392)
            {
                _local_2 = 0;
                while (_local_2 < this._manager._Str_3058._Str_11328.length)
                {
                    if (this._manager._Str_3058._Str_11328[_local_2].id == _local_3._Str_1502)
                    {
                        _local_4._Str_3324 = _local_2;
                        break;
                    }
                    _local_2++;
                }
            }
            else
            {
                _local_2 = 0;
                while (_local_2 < this._manager._Str_3058._Str_12125.length)
                {
                    if (this._manager._Str_3058._Str_12125[_local_2].id == _local_3._Str_1502)
                    {
                        _local_4._Str_3324 = _local_2;
                        break;
                    }
                    _local_2++;
                }
            }
            return _local_4;
        }

        public function _Str_24085(k:BadgeSelectPartCtrl):void
        {
            this._currentLayerOptions._Str_3324 = k._Str_21609();
            this._layers[this._currentLayerOptions._Str_3617].setLayerOptions(this._Str_21658);
            this._partEditContainer.visible = true;
            this._partSelectContainer.visible = false;
        }

        public function _Str_25349(k:BadgeSelectPartCtrl):void
        {
            this._Str_3060(k.layerOptions);
        }

        public function _Str_23517(k:BadgeLayerCtrl):void
        {
            this._Str_3060(k.layerOptions);
        }

        public function _Str_3060(k:BadgeLayerOptions):void
        {
            var _local_2:BitmapData = this._badgeSelectPartCtrl._Str_21949(k);
            if (_local_2 != null)
            {
                this._badgePreviewImages[k._Str_3617].bitmap = _local_2.clone();
                this._badgePreviewImages[k._Str_3617].visible = true;
            }
            else
            {
                this._badgePreviewImages[k._Str_3617].visible = false;
            }
        }

        public function _Str_24453(k:BadgeLayerCtrl):void
        {
            var _local_2:BadgeLayerOptions = this._currentLayerOptions;
            this._currentLayerOptions = k.layerOptions.clone();
            if (!k.layerOptions._Str_23286(_local_2))
            {
                this._badgeSelectPartCtrl._Str_7044();
            }
            else
            {
                this._badgeSelectPartCtrl.layerOptions = this._currentLayerOptions.clone();
            }
            this._partEditContainer.visible = false;
            this._partSelectContainer.visible = true;
        }

        public function _Str_23176():void
        {
            if (((this._Str_6443) && (this._partSelectContainer.visible)))
            {
                this._Str_3060(this._currentLayerOptions);
                this._partEditContainer.visible = true;
                this._partSelectContainer.visible = false;
            }
        }

        public function _Str_15937():Array
        {
            var _local_2:BadgeLayerCtrl;
            var _local_3:int;
            var _local_4:int;
            var k:Array = new Array();
            for each (_local_2 in this._layers)
            {
                _local_3 = this._Str_19168(_local_2.layerOptions);
                if (_local_3 < 0)
                {
                }
                else
                {
                    _local_4 = this._Str_21488(_local_2.layerOptions);
                    if (_local_4 < 0)
                    {
                    }
                    else
                    {
                        k.push(_local_3);
                        k.push(_local_4);
                        k.push(_local_2.layerOptions.position);
                    }
                }
            }
            return k;
        }

        public function get _Str_23897():int
        {
            var _local_2:BadgeLayerCtrl;
            if (this._layers == null)
            {
                return 0;
            }
            var k:int;
            for each (_local_2 in this._layers)
            {
                if (((this._Str_19168(_local_2.layerOptions) < 0) || (this._Str_21488(_local_2.layerOptions) < 0)))
                {
                }
                else
                {
                    k = _local_2.layerOptions.colorIndex;
                }
            }
            return k;
        }

        public function get _Str_24812():int
        {
            if (this._layers != null)
            {
                return this._layers[0].layerOptions.colorIndex;
            }
            return 0;
        }

        public function _Str_23597():BitmapData
        {
            var _local_2:IBitmapWrapperWindow;
            var k:BitmapData = new BitmapData(BadgeEditorPartItem._Str_6696, BadgeEditorPartItem._Str_6533, true, 15329761);
            for each (_local_2 in this._badgePreviewImages)
            {
                if (_local_2.visible)
                {
                    k.copyPixels(_local_2.bitmap, k.rect, new Point(), null, null, true);
                }
            }
            return k;
        }

        private function _Str_19168(k:BadgeLayerOptions):int
        {
            if (k._Str_3324 < 0)
            {
                return -1;
            }
            if (k._Str_3617 == BadgeLayerCtrl._Str_5392)
            {
                if (k._Str_3324 >= this._manager._Str_3058._Str_11328.length)
                {
                    return -1;
                }
                return this._manager._Str_3058._Str_11328[k._Str_3324].id;
            }
            if (k._Str_3324 >= this._manager._Str_3058._Str_12125.length)
            {
                return -1;
            }
            return this._manager._Str_3058._Str_12125[k._Str_3324].id;
        }

        private function _Str_21488(k:BadgeLayerOptions):int
        {
            if (((k.colorIndex < 0) || (k.colorIndex >= this._manager._Str_3058._Str_9008.length)))
            {
                return -1;
            }
            return this._manager._Str_3058._Str_9008[k.colorIndex].id;
        }
    }
}
