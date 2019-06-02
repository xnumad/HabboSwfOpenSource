package com.sulake.habbo.catalog.viewer.widgets
{
    import com.sulake.habbo.room.IGetImageListener;
    import com.sulake.core.utils.Map;
    import com.sulake.core.window.IWindow;
    import com.sulake.habbo.catalog.HabboCatalog;
    import com.sulake.core.window.IWindowContainer;
    import com.sulake.habbo.catalog.IPurchasableOffer;
    import com.sulake.habbo.catalog.viewer.widgets.events.CatalogWidgetEvent;
    import com.sulake.habbo.catalog.viewer.widgets.events.CatalogWidgetPurchaseOverrideEvent;
    import com.sulake.habbo.catalog.viewer.widgets.events.SelectProductEvent;
    import com.sulake.habbo.catalog.viewer.widgets.events._Str_3308;
    import com.sulake.habbo.communication.messages.parser.catalog._Str_3140;
    import com.sulake.habbo.room.PetColorResult;
    import com.sulake.habbo.catalog.viewer.widgets.events.CatalogWidgetMultiColoursEvent;
    import com.sulake.habbo.catalog.viewer.widgets.events.CatalogWidgetColourIndexEvent;
    import com.sulake.core.window.events.WindowEvent;
    import com.sulake.habbo.window.utils._Str_2418;
    import com.sulake.habbo.catalog.viewer.widgets.events.CatalogWidgetApproveNameResultEvent;
    import com.sulake.habbo.localization.IHabboLocalizationManager;
    import com.sulake.habbo.catalog.viewer.widgets.events.CatalogWidgetSellablePetPalettesEvent;
    import com.sulake.habbo.room.IRoomEngine;
    import com.sulake.habbo.avatar.pets.PetCustomPart;
    import com.sulake.room.utils.Vector3d;
    import com.sulake.habbo.room.ImageResult;
    import flash.display.BitmapData;
    import com.sulake.core.window.components.IBitmapWrapperWindow;
    import flash.geom.Point;
    import flash.geom.Matrix;

    public class NewPetsCatalogWidget extends CatalogWidget implements IGetImageListener 
    {
        private static const _Str_13038:Array = [15];
        private static const _Str_13041:int = 20;

        private var _offers:Map;
        private var _inputField:IWindow;
        private var _selectedTypeIndex:int = -1;
        private var _selectedPaletteIndex:int = -1;
        private var _selectedProductCode:String;
        private var _nameApprovalPending:Boolean = false;
        private var _isDisposed:Boolean = false;
        private var _availablePalettes:Array = null;
        private var _catalog:HabboCatalog;
        private var _priceWidget:IWindow;
        private var _imageResultId:int = -1;

        public function NewPetsCatalogWidget(k:IWindowContainer, _arg_2:HabboCatalog)
        {
            super(k);
            this._catalog = _arg_2;
        }

        override public function dispose():void
        {
            if (this._isDisposed)
            {
                return;
            }
            this._nameApprovalPending = false;
            if (this._offers != null)
            {
                this._offers.dispose();
                this._offers = null;
            }
            this._availablePalettes = null;
            this._catalog = null;
            this._priceWidget = null;
            super.dispose();
            this._isDisposed = true;
        }

        override public function init():Boolean
        {
            if (!super.init())
            {
                return false;
            }
            this._nameApprovalPending = false;
            this._inputField = window.findChildByName("name_input_text");
            if (this._inputField == null)
            {
                return false;
            }
            this._inputField.caption = "";
            this._offers = new Map();
            if (page.offers.length == 0)
            {
                return false;
            }
            var k:IPurchasableOffer = page.offers[0];
            this._selectedTypeIndex = this._Str_18763(k.localizationId);
            if (this._selectedTypeIndex < 8)
            {
                return false;
            }
            this._selectedProductCode = k.localizationId;
            this._Str_16879(k.localizationId);
            if (((!(this._availablePalettes == null)) && (this._availablePalettes.length > 0)))
            {
                this._selectedPaletteIndex = 0;
            }
            else
            {
                this._selectedPaletteIndex = -1;
            }
            this._offers.add(this._selectedTypeIndex, k);
            events.addEventListener(CatalogWidgetEvent.SELECT_PRODUCT, this._Str_3115);
            events.addEventListener(CatalogWidgetEvent.COLOUR_INDEX, this._Str_7756);
            events.addEventListener(CatalogWidgetEvent.APPROVE_RESULT, this._Str_11705);
            events.addEventListener(CatalogWidgetEvent.WIDGETS_INITIALIZED, this._Str_3393);
            events.addEventListener(CatalogWidgetEvent.SELLABLE_PET_PALETTES, this._Str_18999);
            return true;
        }

        private function _Str_3393(k:_Str_3308=null):void
        {
            if (this._isDisposed)
            {
                return;
            }
            events.dispatchEvent(new CatalogWidgetPurchaseOverrideEvent(this._Str_8396));
            var _local_2:IPurchasableOffer = this._offers.getWithIndex(0);
            if (_local_2 != null)
            {
                events.dispatchEvent(new SelectProductEvent(_local_2));
            }
            this._Str_21823();
        }

        private function _Str_21823():void
        {
            var k:Array;
            var _local_2:int;
            var _local_3:_Str_3140;
            var _local_4:PetColorResult;
            if (this._availablePalettes != null)
            {
                k = [];
                _local_2 = 0;
                while (((_local_2 < _Str_13041) && (_local_2 < this._availablePalettes.length)))
                {
                    _local_3 = this._availablePalettes[_local_2];
                    _local_4 = this._catalog.roomEngine.getPetColor(this._selectedTypeIndex, _local_3.paletteId);
                    if (_local_4 != null)
                    {
                        if (_local_4._Str_5845 == _local_4._Str_6659)
                        {
                            k.push([_local_4._Str_5845]);
                        }
                        else
                        {
                            k.push([_local_4._Str_5845, _local_4._Str_6659]);
                        }
                    }
                    _local_2++;
                }
                events.dispatchEvent(new CatalogWidgetMultiColoursEvent(k, "ctlg_clr_27x22_1", "ctlg_clr_27x22_2", "ctlg_clr_27x22_3"));
            }
        }

        private function _Str_7756(k:CatalogWidgetColourIndexEvent):void
        {
            if (k == null)
            {
                return;
            }
            var _local_2:int = k.index;
            this._Str_21800(_local_2);
        }

        private function _Str_21800(k:int):void
        {
            if (((!(this._availablePalettes == null)) && (this._availablePalettes.length > 0)))
            {
                if (((k < 0) || (k > this._availablePalettes.length)))
                {
                    k = 0;
                }
                this._selectedPaletteIndex = k;
                this._Str_4497();
            }
        }

        private function _Str_23077():String
        {
            var k:_Str_3140;
            if (this._selectedPaletteIndex < 0)
            {
                return "";
            }
            if (((!(page == null)) && (!(page.viewer == null))))
            {
                if (((!(this._catalog == null)) && (!(this._catalog.localization == null))))
                {
                    k = (this._availablePalettes[this._selectedPaletteIndex] as _Str_3140);
                    return this._catalog.localization.getLocalization(this._Str_9430(this._selectedTypeIndex, k.breedId), this._Str_9430(this._selectedTypeIndex, k.breedId));
                }
            }
            k = this._availablePalettes[this._selectedPaletteIndex];
            return this._Str_9430(this._selectedTypeIndex, k.breedId);
        }

        private function _Str_8396(k:WindowEvent):void
        {
            if (this._nameApprovalPending)
            {
                Logger.log("* Cannot buy a pet, pending previous name approval.");
            }
            if (this._Str_11391() == "")
            {
                return;
            }
            var _local_2:String = this._inputField.caption;
            this._nameApprovalPending = true;
            this._catalog._Str_19478(_local_2, 1);
        }

        private function _Str_3115(k:SelectProductEvent):void
        {
            if (k == null)
            {
                return;
            }
            this._Str_4497();
        }

        private function _Str_11705(event:CatalogWidgetApproveNameResultEvent):void
        {
            if (((event == null) || (!(this._nameApprovalPending))))
            {
                return;
            }
            this._nameApprovalPending = false;
            var nameValidationInfo:String = event.nameValidationInfo;
            if (event.result != 0)
            {
                this._catalog._Str_8986(false);
            }
            switch (event.result)
            {
                case 1:
                    this._catalog.windowManager.alert("${catalog.alert.purchaseerror.title}", this._Str_4902("long", nameValidationInfo), 0, function (k:_Str_2418, _arg_2:WindowEvent):void
                    {
                        k.dispose();
                    });
                    return;
                case 2:
                    this._catalog.windowManager.alert("${catalog.alert.purchaseerror.title}", this._Str_4902("short", nameValidationInfo), 0, function (k:_Str_2418, _arg_2:WindowEvent):void
                    {
                        k.dispose();
                    });
                    return;
                case 3:
                    this._catalog.windowManager.alert("${catalog.alert.purchaseerror.title}", this._Str_4902("chars", nameValidationInfo), 0, function (k:_Str_2418, _arg_2:WindowEvent):void
                    {
                        k.dispose();
                    });
                    return;
                case 4:
                    this._catalog.windowManager.alert("${catalog.alert.purchaseerror.title}", this._Str_4902("bobba", nameValidationInfo), 0, function (k:_Str_2418, _arg_2:WindowEvent):void
                    {
                        k.dispose();
                    });
                    return;
            }
            var extraParameter:String = this._Str_11391();
            if (extraParameter == "")
            {
                Logger.log("* Not enough information to buy a pet!");
                return;
            }
            Logger.log(("* Will buy pet as " + extraParameter));
            this._catalog._Str_5649(this._offers.getWithIndex(0), page.pageId, extraParameter, 1, null, null, true, this.getPetImage());
        }

        private function _Str_4902(k:String, _arg_2:String):String
        {
            var _local_3:IHabboLocalizationManager = this._catalog.localization;
            var _local_4:String = ("catalog.alert.petname." + k);
            var _local_5:* = (_local_4 + ".additionalInfo");
            _local_3.registerParameter(_local_5, "additional_info", _arg_2);
            var _local_6:String = _local_3.getLocalization(_local_4);
            var _local_7:String = _local_3.getLocalization(_local_5);
            if (((((!(_arg_2 == null)) && (_arg_2.length > 0)) && (!(_local_7 == null))) && (_local_7.length > 0)))
            {
                _local_6 = _local_7;
            }
            return _local_6;
        }

        private function _Str_18999(k:CatalogWidgetSellablePetPalettesEvent):void
        {
            if (k.productCode == this._selectedProductCode)
            {
                this._availablePalettes = this._Str_11449(k._Str_13588);
                this._Str_21823();
                this._Str_21800(0);
                this._Str_4497();
            }
        }

        private function _Str_11449(k:Array):Array
        {
            var _local_3:_Str_3140;
            if (!k)
            {
                return null;
            }
            var _local_2:Array = new Array();
            for each (_local_3 in k)
            {
                if (((_local_3.type == this._selectedTypeIndex) && (_local_3.sellable)))
                {
                    _local_2.push(_local_3);
                }
            }
            return _local_2;
        }

        private function getPetImage():BitmapData
        {
            var _local_2:int;
            var _local_6:IRoomEngine;
            var _local_11:int;
            var _local_12:int;
            var _local_13:PetColorResult;
            var _local_14:PetColorResult;
            var _local_15:int;
            var _local_16:int;
            var _local_17:PetCustomPart;
            var _local_18:PetCustomPart;
            var k:IPurchasableOffer = this._offers.getWithIndex(0);
            if (((k == null) || (this._selectedPaletteIndex < 0)))
            {
                return null;
            }
            _local_2 = this._selectedTypeIndex;
            var _local_3:_Str_3140 = this._availablePalettes[this._selectedPaletteIndex];
            var _local_4:int = _local_3.paletteId;
            var _local_5:* = 0xFFFFFF;
            _local_6 = this._catalog.roomEngine;
            var _local_7:* = (_Str_13038.indexOf(_local_2) == -1);
            var _local_8:Vector3d = ((_local_7) ? new Vector3d(135) : new Vector3d(90));
            var _local_9:Array = [];
            switch (_local_2)
            {
                case 15:
                    _local_11 = _local_6.getPetLayerIdForTag(_local_2, "hair");
                    _local_12 = _local_6.getPetLayerIdForTag(_local_2, "tail");
                    _local_13 = _local_6.getPetDefaultPalette(_local_2, "hair");
                    _local_14 = _local_6.getPetDefaultPalette(_local_2, "tail");
                    _local_15 = ((_local_13) ? parseInt(_local_13.id) : -1);
                    _local_16 = ((_local_14) ? parseInt(_local_14.id) : -1);
                    _local_17 = new PetCustomPart(_local_11, -1, _local_15);
                    _local_18 = new PetCustomPart(_local_12, -1, _local_16);
                    _local_9 = [_local_17, _local_18];
                    break;
            }
            var _local_10:ImageResult = _local_6.getPetImage(_local_2, _local_4, _local_5, _local_8, 64, this, true, 0, _local_9);
            if (_local_10 != null)
            {
                this._imageResultId = _local_10.id;
                return _local_10.data;
            }
            return null;
        }

        private function _Str_4497():void
        {
            var k:IPurchasableOffer = this._offers.getWithIndex(0);
            if (((k == null) || (this._selectedPaletteIndex < 0)))
            {
                return;
            }
            var _local_2:BitmapData = this.getPetImage();
            if (_local_2 != null)
            {
                this._Str_3234(_local_2, true);
            }
            var _local_3:IWindow = window.findChildByName("ctlg_teaserimg_1");
            this._priceWidget = this._catalog.utils._Str_7075(k, _window, this._priceWidget, _local_3, -6, false, 6);
            var _local_4:IWindow = _window.findChildByName("pet_breed_text");
            if (_local_4)
            {
                _local_4.caption = this._Str_23077();
            }
        }

        private function _Str_11391():String
        {
            var name:String = this._inputField.caption;
            if (((name == null) || (name.length == 0)))
            {
                this._catalog.windowManager.alert("${catalog.alert.purchaseerror.title}", "${catalog.alert.petname.empty}", 0, function (k:_Str_2418, _arg_2:WindowEvent):void
                {
                    k.dispose();
                });
                return "";
            }
            if (this._selectedPaletteIndex < 0)
            {
                return "";
            }
            var color:uint = 0xFFFFFF;
            var data:_Str_3140 = this._availablePalettes[this._selectedPaletteIndex];
            var p:String = ((((name + String.fromCharCode(10)) + data.paletteId) + String.fromCharCode(10)) + this._Str_17779(color.toString(16).toUpperCase(), 6));
            return p;
        }

        private function _Str_3234(k:BitmapData, _arg_2:Boolean):void
        {
            var _local_3:IBitmapWrapperWindow;
            var _local_4:int;
            var _local_5:BitmapData;
            var _local_6:Point;
            if (!window.disposed)
            {
                if (k == null)
                {
                    k = new BitmapData(1, 1);
                    _arg_2 = true;
                }
                _local_3 = (window.findChildByName("ctlg_teaserimg_1") as IBitmapWrapperWindow);
                if (_local_3 != null)
                {
                    if (_local_3.bitmap == null)
                    {
                        _local_3.bitmap = new BitmapData(_local_3.width, _local_3.height, true, 0xFFFFFF);
                    }
                    _local_3.bitmap.fillRect(_local_3.bitmap.rect, 0xFFFFFF);
                    _local_4 = 1;
                    if (_Str_13038.indexOf(this._selectedTypeIndex) == -1)
                    {
                        _local_4 = 2;
                    }
                    _local_5 = new BitmapData((k.width * _local_4), (k.height * _local_4), true, 0xFFFFFF);
                    _local_5.draw(k, new Matrix(_local_4, 0, 0, _local_4));
                    _local_6 = new Point(((_local_3.width - _local_5.width) / 2), ((_local_3.height - _local_5.height) / 2));
                    _local_3.bitmap.copyPixels(_local_5, _local_5.rect, _local_6, null, null, true);
                    _local_3.invalidate();
                    _local_5.dispose();
                }
            }
            if (_arg_2)
            {
                k.dispose();
            }
        }

        private function _Str_18763(k:String):int
        {
            if (k.length == 0)
            {
                return 0;
            }
            var _local_2:int;
            _local_2 = (k.length - 1);
            while (_local_2 >= 0)
            {
                if (isNaN(parseInt(k.charAt(_local_2))))
                {
                    break;
                }
                _local_2--;
            }
            if (_local_2 > 0)
            {
                return int(k.substring((_local_2 + 1)));
            }
            return -1;
        }

        private function _Str_9430(k:int, _arg_2:int):String
        {
            return (("pet.breed." + k) + ".") + _arg_2;
        }

        private function _Str_17779(k:String, _arg_2:int):String
        {
            while (k.length < _arg_2)
            {
                k = ("0" + k);
            }
            return k;
        }

        private function _Str_16879(k:String):void
        {
            var _local_2:Array;
            if (this._availablePalettes == null)
            {
                _local_2 = this._catalog._Str_20009(k);
                this._availablePalettes = this._Str_11449(_local_2);
            }
        }

        public function imageReady(k:int, _arg_2:BitmapData):void
        {
            if (disposed)
            {
                return;
            }
            if (k == this._imageResultId)
            {
                this._Str_3234(_arg_2, true);
                this._Str_3393();
            }
        }

        public function imageFailed(k:int):void
        {
        }
    }
}
