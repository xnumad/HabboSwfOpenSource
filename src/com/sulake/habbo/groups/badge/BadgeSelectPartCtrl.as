package com.sulake.habbo.groups.badge
{
    import com.sulake.core.runtime.IDisposable;
    import com.sulake.habbo.groups.HabboGroupsManager;
    import __AS3__.vec.Vector;
    import com.sulake.core.window.IWindowContainer;
    import com.sulake.core.window.components.IBitmapWrapperWindow;
    import com.sulake.habbo.communication.messages.incoming.users._Str_3740;
    import flash.display.BitmapData;
    import flash.geom.Point;
    import com.sulake.core.window.components.IBorderWindow;
    import com.sulake.core.window.events.WindowMouseEvent;
    import com.sulake.core.window.events.WindowEvent;
    import com.sulake.core.window.IWindow;
    import __AS3__.vec.*;

    public class BadgeSelectPartCtrl implements IDisposable 
    {
        private var _manager:HabboGroupsManager;
        private var _parentCtrl:BadgeEditorCtrl;
        private var _badgeLayerParts:Vector.<BadgeEditorPartItem>;
        private var _badgeBaseParts:Vector.<BadgeEditorPartItem>;
        private var _layerOptions:BadgeLayerOptions;
        private var _selectedItem:IWindowContainer;
        private var _chosenItem:IBitmapWrapperWindow;
        private var _disposed:Boolean = false;

        public function BadgeSelectPartCtrl(k:HabboGroupsManager, _arg_2:BadgeEditorCtrl)
        {
            this._manager = k;
            this._parentCtrl = _arg_2;
        }

        public function get layerOptions():BadgeLayerOptions
        {
            return this._layerOptions;
        }

        public function set layerOptions(k:BadgeLayerOptions):void
        {
            this._layerOptions = k;
        }

        public function dispose():void
        {
            var k:BadgeEditorPartItem;
            if (!this._disposed)
            {
                if (((!(this._parentCtrl._Str_5636 == null)) && (this._parentCtrl._Str_5636.numGridItems > 0)))
                {
                    this._parentCtrl._Str_5636.destroyGridItems();
                }
                if (this._badgeBaseParts)
                {
                    for each (k in this._badgeBaseParts)
                    {
                        k.dispose();
                    }
                    this._badgeBaseParts = null;
                }
                if (this._badgeLayerParts)
                {
                    for each (k in this._badgeLayerParts)
                    {
                        k.dispose();
                    }
                    this._badgeLayerParts = null;
                }
                this._layerOptions = null;
                this._chosenItem = null;
                this._selectedItem = null;
                this._parentCtrl = null;
                this._manager = null;
                this._disposed = true;
            }
        }

        public function get disposed():Boolean
        {
            return this._disposed;
        }

        public function _Str_21609():int
        {
            var k:int = -1;
            if ((((!(this._layerOptions == null)) && (!(this._parentCtrl._Str_5636 == null))) && (!(this._selectedItem == null))))
            {
                k = this._parentCtrl._Str_5636._Str_3373(this._selectedItem);
                if (((!(k == -1)) && (!(this._layerOptions._Str_3617 == BadgeLayerCtrl._Str_5392))))
                {
                    k--;
                }
            }
            return k;
        }

        public function loadData():void
        {
            var k:_Str_3740;
            if (((!(this._badgeBaseParts == null)) || (!(this._badgeLayerParts == null))))
            {
                return;
            }
            this._badgeBaseParts = new Vector.<BadgeEditorPartItem>();
            for each (k in this._manager._Str_3058._Str_11328)
            {
                this._badgeBaseParts.push(new BadgeEditorPartItem(this._manager, this, this._badgeBaseParts.length, BadgeEditorPartItem._Str_13754, k));
            }
            this._badgeLayerParts = new Vector.<BadgeEditorPartItem>();
            this._badgeLayerParts.push(new BadgeEditorPartItem(this._manager, this, -1, BadgeEditorPartItem._Str_13419));
            for each (k in this._manager._Str_3058._Str_12125)
            {
                this._badgeLayerParts.push(new BadgeEditorPartItem(this._manager, this, (this._badgeLayerParts.length - 1), BadgeEditorPartItem._Str_13419, k));
            }
        }

        public function _Str_7044():void
        {
            var k:BadgeEditorPartItem;
            this._selectedItem = null;
            this._chosenItem = null;
            this._layerOptions = this._parentCtrl._Str_21658.clone();
            this._parentCtrl._Str_5636.destroyGridItems();
            if (this._layerOptions._Str_3617 == BadgeLayerCtrl._Str_5392)
            {
                for each (k in this._badgeBaseParts)
                {
                    this._parentCtrl._Str_5636._Str_2816(this._Str_7360(k));
                }
            }
            else
            {
                for each (k in this._badgeLayerParts)
                {
                    this._parentCtrl._Str_5636._Str_2816(this._Str_7360(k));
                }
            }
        }

        private function _Str_7360(k:BadgeEditorPartItem):IWindowContainer
        {
            var _local_2:IWindowContainer = (this._manager.getXmlWindow("badge_part_item") as IWindowContainer);
            _local_2.procedure = this._Str_23375;
            this._Str_17901(_local_2, k);
            return _local_2;
        }

        public function _Str_25511(k:BadgeEditorPartItem):void
        {
            var _local_2:IWindowContainer;
            if ((((!(this._layerOptions == null)) && (this._layerOptions._Str_3617 == BadgeLayerCtrl._Str_5392)) && (this._parentCtrl._Str_20634.visible)))
            {
                _local_2 = (this._parentCtrl._Str_5636._Str_2830(k._Str_3324) as IWindowContainer);
                this._Str_17901(_local_2, k);
            }
        }

        public function _Str_22980(k:BadgeEditorPartItem):void
        {
            var _local_2:IWindowContainer;
            if ((((!(this._layerOptions == null)) && (!(this._layerOptions._Str_3617 == BadgeLayerCtrl._Str_5392))) && (this._parentCtrl._Str_20634.visible)))
            {
                _local_2 = (this._parentCtrl._Str_5636._Str_2830((k._Str_3324 + 1)) as IWindowContainer);
                this._Str_17901(_local_2, k);
            }
        }

        private function _Str_17901(k:IWindowContainer, _arg_2:BadgeEditorPartItem):void
        {
            var _local_5:IBitmapWrapperWindow;
            var _local_3:BitmapData = _arg_2.getComposite(this._layerOptions);
            if (_local_3 != null)
            {
                _local_5 = (k.findChildByName("part") as IBitmapWrapperWindow);
                _local_5.bitmap = new BitmapData(_local_3.width, _local_3.height);
                _local_5.bitmap.copyPixels(_local_3, _local_3.rect, new Point());
            }
            var _local_4:IBitmapWrapperWindow = (k.findChildByName("selected") as IBitmapWrapperWindow);
            _local_4.bitmap = this._manager._Str_3122("badge_part_picker");
            if (_arg_2._Str_3324 == this._layerOptions._Str_3324)
            {
                _local_4.visible = true;
                this._chosenItem = _local_4;
            }
            else
            {
                _local_4.visible = false;
            }
        }

        private function _Str_23375(k:WindowEvent, _arg_2:IWindow):void
        {
            var _local_3:IBorderWindow;
            var _local_4:IWindowContainer;
            if (k.type == WindowMouseEvent.OVER)
            {
                if (this._selectedItem != _arg_2)
                {
                    if (this._selectedItem != null)
                    {
                        _local_3 = (this._selectedItem.findChildByName("background") as IBorderWindow);
                        if (_local_3 != null)
                        {
                            _local_3.color = 15329761;
                        }
                    }
                    this._selectedItem = (_arg_2 as IWindowContainer);
                    if (this._selectedItem != null)
                    {
                        _local_3 = (this._selectedItem.findChildByName("background") as IBorderWindow);
                        if (_local_3 != null)
                        {
                            _local_3.color = 14210761;
                        }
                        this._layerOptions._Str_3324 = this._Str_21609();
                        this._parentCtrl._Str_25349(this);
                    }
                }
            }
            if (k.type == WindowMouseEvent.CLICK)
            {
                if (this._chosenItem != null)
                {
                    this._chosenItem.visible = false;
                }
                _local_4 = (_arg_2 as IWindowContainer);
                if (_local_4 != null)
                {
                    this._chosenItem = (_local_4.findChildByName("selected") as IBitmapWrapperWindow);
                    this._chosenItem.visible = true;
                }
                this._parentCtrl._Str_24085(this);
            }
        }

        public function _Str_21949(k:BadgeLayerOptions):BitmapData
        {
            if (((k == null) || (k._Str_3324 < 0)))
            {
                return null;
            }
            if (k._Str_3617 == BadgeLayerCtrl._Str_5392)
            {
                if (((!(this._badgeBaseParts == null)) && (k._Str_3324 < this._badgeBaseParts.length)))
                {
                    return this._badgeBaseParts[k._Str_3324].getComposite(k);
                }
            }
            else
            {
                if (((!(this._badgeLayerParts == null)) && ((k._Str_3324 + 1) < this._badgeLayerParts.length)))
                {
                    return this._badgeLayerParts[(k._Str_3324 + 1)].getComposite(k);
                }
            }
            return null;
        }
    }
}
