package com.sulake.habbo.groups
{
    import com.sulake.core.window.IWindowContainer;
    import __AS3__.vec.Vector;
    import com.sulake.habbo.communication.messages.incoming.users._Str_2792;
    import com.sulake.core.window.components.IItemGridWindow;
    import flash.display.BitmapData;
    import com.sulake.core.window.components.IBitmapWrapperWindow;
    import flash.geom.ColorTransform;
    import com.sulake.core.assets.BitmapDataAsset;
    import com.sulake.core.runtime.exceptions.Exception;
    import com.sulake.core.window.IWindow;
    import com.sulake.core.window.events.WindowMouseEvent;
    import com.sulake.core.window.events.WindowEvent;

    public class ColorGridCtrl 
    {
        private var _manager:HabboGroupsManager;
        private var _parentWindow:IWindowContainer;
        private var _parentCallback:Function;
        private var _colorData:Vector.<_Str_2792>;
        private var _colorGrid:IItemGridWindow;
        private var _selectedColorIndex:int = -1;
        private var _selectedColorBitmap:BitmapData;
        private var _backgroundBitmap:BitmapData;
        private var _foregroundBitmap:BitmapData;
        private var _disposed:Boolean = false;

        public function ColorGridCtrl(k:HabboGroupsManager, _arg_2:Function)
        {
            this._manager = k;
            this._parentCallback = _arg_2;
        }

        public function get _Str_4246():int
        {
            return this._selectedColorIndex;
        }

        public function get isInitialized():Boolean
        {
            return (!(this._colorData == null)) && (!(this._colorGrid == null));
        }

        public function dispose():void
        {
            if (!this._disposed)
            {
                if (this._colorGrid)
                {
                    this._colorGrid.destroyGridItems();
                    this._colorGrid = null;
                }
                if (this._backgroundBitmap)
                {
                    this._backgroundBitmap.dispose();
                    this._backgroundBitmap = null;
                }
                if (this._foregroundBitmap)
                {
                    this._foregroundBitmap.dispose();
                    this._foregroundBitmap = null;
                }
                if (this._backgroundBitmap)
                {
                    this._backgroundBitmap.dispose();
                    this._backgroundBitmap = null;
                }
                if (this._selectedColorBitmap)
                {
                    this._selectedColorBitmap.dispose();
                    this._selectedColorBitmap = null;
                }
                this._manager = null;
                this._parentWindow = null;
                this._disposed = true;
            }
        }

        public function _Str_16890(k:IWindowContainer, _arg_2:String, _arg_3:Vector.<_Str_2792>):void
        {
            var _local_4:_Str_2792;
            var _local_5:IWindowContainer;
            if (((((!(this._colorGrid == null)) || (k == null)) || (_arg_2 == null)) || (_arg_3 == null)))
            {
                return;
            }
            this._parentWindow = k;
            this._colorData = _arg_3;
            this._colorGrid = (this._parentWindow.findChildByName(_arg_2) as IItemGridWindow);
            this._backgroundBitmap = this.getBitmap("color_chooser_bg");
            this._foregroundBitmap = this.getBitmap("color_chooser_fg");
            this._selectedColorBitmap = this.getBitmap("color_chooser_selected");
            for each (_local_4 in this._colorData)
            {
                _local_5 = (this._manager.getXmlWindow("badge_color_item") as IWindowContainer);
                _local_5.procedure = this.onClick;
                _local_5.background = true;
                _local_5.color = 4290689957;
                _local_5.width = this._backgroundBitmap.width;
                _local_5.height = this._backgroundBitmap.height;
                this._Str_18553(_local_5, "background", this._backgroundBitmap, true, null);
                this._Str_18553(_local_5, "foreground", this._foregroundBitmap, true, _local_4);
                this._Str_18553(_local_5, "selected", this._selectedColorBitmap, false, null);
                this._colorGrid._Str_2816(_local_5);
            }
        }

        private function _Str_18553(k:IWindowContainer, _arg_2:String, _arg_3:BitmapData, _arg_4:Boolean, _arg_5:_Str_2792=null):void
        {
            var _local_7:BitmapData;
            var _local_6:IBitmapWrapperWindow = (k.findChildByName(_arg_2) as IBitmapWrapperWindow);
            if (_local_6 != null)
            {
                _local_7 = _arg_3.clone();
                if (_arg_5 != null)
                {
                    _local_7.colorTransform(_local_7.rect, new ColorTransform((_arg_5.red / 0xFF), (_arg_5.green / 0xFF), (_arg_5.blue / 0xFF)));
                }
                _local_6.bitmap = _local_7;
                _local_6.visible = _arg_4;
            }
        }

        public function _Str_6965(k:int, _arg_2:Boolean=true):void
        {
            if (k < 0)
            {
                k = 0;
            }
            if (((!(this._selectedColorIndex == k)) && (k < this._colorGrid.numGridItems)))
            {
                this._Str_20185(this._selectedColorIndex, false);
                this._selectedColorIndex = k;
                this._Str_20185(this._selectedColorIndex, true);
            }
            if (((_arg_2) && (!(this._parentCallback == null))))
            {
                this._parentCallback(this);
            }
        }

        public function _Str_6434(k:int):void
        {
            if (!this.isInitialized)
            {
                return;
            }
            var _local_2:int;
            while (_local_2 < this._colorData.length)
            {
                if (this._colorData[_local_2].id == k)
                {
                    this._Str_6965(_local_2);
                    return;
                }
                _local_2++;
            }
            this._Str_6965(0);
        }

        public function _Str_15044():int
        {
            var k:_Str_2792 = this._Str_10058();
            if (k != null)
            {
                return k.id;
            }
            return 0;
        }

        public function _Str_10058():_Str_2792
        {
            if ((((!(this._colorData == null)) && (this._selectedColorIndex >= 0)) && (this._selectedColorIndex < this._colorData.length)))
            {
                return this._colorData[this._selectedColorIndex];
            }
            return null;
        }

        private function getBitmap(k:String):BitmapData
        {
            var _local_3:BitmapData;
            var _local_2:BitmapDataAsset = (this._manager.assets.getAssetByName(k) as BitmapDataAsset);
            if (_local_2)
            {
                _local_3 = (_local_2.content as BitmapData);
                if (_local_3 != null)
                {
                    return _local_3;
                }
            }
            throw (new Exception((("Failed to load bitmap asset " + k) + " in ColorGridWidget")));
        }

        private function _Str_20185(k:int, _arg_2:Boolean):void
        {
            var _local_4:IWindow;
            if (((k < 0) || (k >= this._colorGrid.numGridItems)))
            {
                return;
            }
            var _local_3:IWindowContainer = (this._colorGrid._Str_2830(k) as IWindowContainer);
            if (_local_3 != null)
            {
                _local_4 = (_local_3.findChildByName("selected") as IWindow);
                if (_local_4 != null)
                {
                    _local_4.visible = _arg_2;
                }
            }
        }

        private function onClick(k:WindowEvent, _arg_2:IWindow):void
        {
            if (k.type != WindowMouseEvent.CLICK)
            {
                return;
            }
            this._Str_6965(this._colorGrid._Str_3373(_arg_2));
        }
    }
}
