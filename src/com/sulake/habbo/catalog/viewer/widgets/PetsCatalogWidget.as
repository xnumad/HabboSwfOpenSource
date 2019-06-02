package com.sulake.habbo.catalog.viewer.widgets
{
    import com.sulake.habbo.room.IGetImageListener;
    import com.sulake.core.utils.Map;
    import com.sulake.habbo.catalog.HabboCatalog;
    import com.sulake.core.window.IWindow;
    import com.sulake.core.window.IWindowContainer;
    import com.sulake.habbo.catalog.IPurchasableOffer;
    import com.sulake.habbo.catalog.viewer.widgets.events.CatalogWidgetEvent;
    import com.sulake.habbo.catalog.viewer.widgets.events.CatalogWidgetPurchaseOverrideEvent;
    import com.sulake.habbo.catalog.viewer.Offer;
    import com.sulake.habbo.catalog.viewer.widgets.events.SelectProductEvent;
    import com.sulake.habbo.catalog.viewer.widgets.events.CatalogWidgetColoursEvent;
    import com.sulake.habbo.catalog.viewer.widgets.events._Str_3308;
    import com.sulake.core.window.events.WindowEvent;
    import com.sulake.core.window.components.IDropMenuWindow;
    import com.sulake.habbo.catalog.viewer.widgets.events.CatalogWidgetColourIndexEvent;
    import com.sulake.habbo.window.utils._Str_2418;
    import com.sulake.habbo.catalog.viewer.widgets.events.CatalogWidgetApproveNameResultEvent;
    import com.sulake.habbo.localization.IHabboLocalizationManager;
    import com.sulake.habbo.catalog.viewer.widgets.events.CatalogWidgetSellablePetPalettesEvent;
    import com.sulake.habbo.communication.messages.parser.catalog._Str_3140;
    import com.sulake.room.utils.Vector3d;
    import com.sulake.habbo.room.ImageResult;
    import flash.display.BitmapData;
    import com.sulake.core.window.components.IBitmapWrapperWindow;
    import flash.geom.Point;
    import flash.geom.Matrix;

    public class PetsCatalogWidget extends CatalogWidget implements IGetImageListener 
    {
        private var _offers:Map;
        private var _selectedTypeIndex:int = -1;
        private var _selectedPaletteIndex:int = 0;
        private var _selectedColorIndex:int = 0;
        private var _selectedProductCode:String;
        private var _nameApprovalPending:Boolean = false;
        private var _availablePalettes:Array;
        private var _availableColors:Array;
        private var _isDisposed:Boolean = false;
        private var _catalog:HabboCatalog;
        private var _priceWidget:IWindow;
        private var _imageResultId:int = -1;
        private var _inputField:IWindow;

        public function PetsCatalogWidget(k:IWindowContainer, _arg_2:HabboCatalog)
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
            this._offers.dispose();
            this._offers = null;
            this._availablePalettes = null;
            this._availableColors = null;
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
            var k:IWindow = window.findChildByName("ctlg_buy_button");
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
            var _local_2:IPurchasableOffer = page.offers[0];
            this._selectedTypeIndex = this._Str_18763(_local_2.localizationId);
            if (this._selectedTypeIndex >= 8)
            {
                return false;
            }
            this._Str_16879(_local_2.localizationId);
            this._selectedProductCode = _local_2.localizationId;
            this._Str_25742();
            this._offers.add(this._selectedTypeIndex, _local_2);
            events.addEventListener(CatalogWidgetEvent.SELECT_PRODUCT, this._Str_3115);
            events.addEventListener(CatalogWidgetEvent.COLOUR_INDEX, this._Str_7756);
            events.addEventListener(CatalogWidgetEvent.APPROVE_RESULT, this._Str_11705);
            events.addEventListener(CatalogWidgetEvent.WIDGETS_INITIALIZED, this._Str_3393);
            events.addEventListener(CatalogWidgetEvent.SELLABLE_PET_PALETTES, this._Str_18999);
            return true;
        }

        private function _Str_25742():void
        {
            this._availableColors = [];
            if (this._selectedTypeIndex == 0)
            {
                this._availableColors = [16743226, 16750435, 16764339, 0xF59500, 16498012, 16704690, 0xEDD400, 16115545, 16513201, 8694111, 11585939, 14413767, 6664599, 9553845, 12971486, 8358322, 10002885, 13292268, 10780600, 12623573, 14403561, 12418717, 14327229, 15517403, 14515069, 15764368, 16366271, 0xABABAB, 0xD4D4D4, 0xFFFFFF, 14256481, 14656129, 15848130, 14005087, 14337152, 15918540, 15118118, 15531929, 9764857, 11258085];
            }
            else
            {
                if (this._selectedTypeIndex == 1)
                {
                    this._availableColors = [16743226, 16750435, 16764339, 0xF59500, 16498012, 16704690, 0xEDD400, 16115545, 16513201, 8694111, 11585939, 14413767, 6664599, 9553845, 12971486, 8358322, 10002885, 13292268, 10780600, 12623573, 14403561, 12418717, 14327229, 15517403, 14515069, 15764368, 16366271, 0xABABAB, 0xD4D4D4, 0xFFFFFF, 14256481, 14656129, 15848130, 14005087, 14337152, 15918540, 15118118, 15531929, 9764857, 11258085];
                }
                else
                {
                    if (this._selectedTypeIndex == 2)
                    {
                        this._availableColors = [16579283, 15378351, 8830016, 15257125, 9340985, 8949607, 6198292, 8703620, 9889626, 8972045, 12161285, 13162269, 8620113, 12616503, 8628101, 0xD2FF00, 9764857];
                    }
                    else
                    {
                        if (this._selectedTypeIndex == 3)
                        {
                            this._availableColors = [0xFFFFFF, 0xEEEEEE, 0xDDDDDD];
                        }
                        else
                        {
                            if (this._selectedTypeIndex == 4)
                            {
                                this._availableColors = [0xFFFFFF, 16053490, 15464440, 16248792, 15396319, 15007487];
                            }
                            else
                            {
                                if (this._selectedTypeIndex == 5)
                                {
                                    this._availableColors = [0xFFFFFF, 0xEEEEEE, 0xDDDDDD];
                                }
                                else
                                {
                                    if (this._selectedTypeIndex == 6)
                                    {
                                        this._availableColors = [0xFFFFFF, 0xEEEEEE, 0xDDDDDD, 16767177, 16770205, 16751331];
                                    }
                                    else
                                    {
                                        if (this._selectedTypeIndex == 7)
                                        {
                                            this._availableColors = [0xCCCCCC, 0xAEAEAE, 16751331, 10149119, 16763290, 16743786];
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }

        private function _Str_3393(k:_Str_3308=null):void
        {
            var _local_4:int;
            if (this._isDisposed)
            {
                return;
            }
            events.dispatchEvent(new CatalogWidgetPurchaseOverrideEvent(this._Str_8396));
            var _local_2:Offer = this._offers.getWithIndex(0);
            if (_local_2 != null)
            {
                events.dispatchEvent(new SelectProductEvent(_local_2));
            }
            var _local_3:Array = [];
            for each (_local_4 in this._availableColors)
            {
                _local_3.push(_local_4);
            }
            events.dispatchEvent(new CatalogWidgetColoursEvent(_local_3, "ctlg_clr_27x22_1", "ctlg_clr_27x22_2", "ctlg_clr_27x22_3"));
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
            this._nameApprovalPending = true;
            this._catalog._Str_19478(this._inputField.caption, 1);
        }

        public function _Str_22748(k:WindowEvent, _arg_2:IWindow):void
        {
            var _local_3:int;
            if (k.type == WindowEvent.WINDOW_EVENT_SELECTED)
            {
                _local_3 = IDropMenuWindow(_arg_2).selection;
                if (((this._availablePalettes == null) || (_local_3 >= this._availablePalettes.length)))
                {
                    return;
                }
                this._selectedPaletteIndex = _local_3;
                this._Str_4497();
            }
        }

        private function _Str_3115(k:SelectProductEvent):void
        {
            if (k == null)
            {
                return;
            }
            this._Str_4497();
        }

        private function _Str_7756(k:CatalogWidgetColourIndexEvent):void
        {
            if (k == null)
            {
                return;
            }
            this._selectedColorIndex = k.index;
            if (((this._selectedColorIndex < 0) || (this._selectedColorIndex > this._availableColors.length)))
            {
                this._selectedColorIndex = 0;
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
                this._selectedPaletteIndex = 0;
                this._Str_19742();
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

        private function _Str_19742():void
        {
            var _local_5:_Str_3140;
            var k:IHabboLocalizationManager = this._catalog.localization;
            var _local_2:Array = new Array();
            var _local_3:int;
            while (_local_3 < this._availablePalettes.length)
            {
                _local_5 = (this._availablePalettes[_local_3] as _Str_3140);
                _local_2.push(k.getLocalization(this._Str_9430(this._selectedTypeIndex, _local_5.breedId), this._Str_9430(this._selectedTypeIndex, _local_5.breedId)));
                _local_3++;
            }
            var _local_4:IDropMenuWindow = (window.findChildByName("type_drop_menu") as IDropMenuWindow);
            if (_local_4 == null)
            {
                return;
            }
            if (_local_2.length > 1)
            {
                _local_4.populate(_local_2);
                _local_4.selection = 0;
                _local_4.procedure = this._Str_22748;
                _local_4.visible = true;
            }
            else
            {
                _local_4.visible = false;
            }
            this._Str_4497();
        }

        private function getPetImage():BitmapData
        {
            var k:Offer = this._offers.getWithIndex(0);
            if (k == null)
            {
                return null;
            }
            if (((this._availablePalettes == null) || (this._selectedPaletteIndex >= this._availablePalettes.length)))
            {
                return null;
            }
            var _local_2:uint = 0xFFFFFF;
            if (((this._selectedColorIndex >= 0) && (this._selectedColorIndex < this._availableColors.length)))
            {
                _local_2 = this._availableColors[this._selectedColorIndex];
            }
            var _local_3:int = this._selectedTypeIndex;
            var _local_4:_Str_3140 = (this._availablePalettes[this._selectedPaletteIndex] as _Str_3140);
            var _local_5:int = _local_4.paletteId;
            var _local_6:ImageResult = this._catalog.roomEngine.getPetImage(_local_3, _local_5, _local_2, new Vector3d(90, 0, 0), 64, this);
            if (_local_6 != null)
            {
                this._imageResultId = _local_6.id;
                return _local_6.data;
            }
            return null;
        }

        private function _Str_4497():void
        {
            var k:Offer = this._offers.getWithIndex(0);
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
            if (((this._availablePalettes == null) || (this._selectedPaletteIndex >= this._availablePalettes.length)))
            {
                return "";
            }
            if (this._selectedColorIndex >= this._availableColors.length)
            {
                return "";
            }
            var color:uint = this._availableColors[this._selectedColorIndex];
            var data:_Str_3140 = (this._availablePalettes[this._selectedPaletteIndex] as _Str_3140);
            var paletteId:int = data.paletteId;
            var p:String = ((((name + String.fromCharCode(10)) + paletteId) + String.fromCharCode(10)) + this._Str_17779(color.toString(16).toUpperCase(), 6));
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
                    _local_4 = 2;
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
                this._selectedPaletteIndex = 0;
                if (this._availablePalettes != null)
                {
                    this._Str_19742();
                }
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
