package com.sulake.habbo.nux
{
    import com.sulake.habbo.session.product.IProductDataListener;
    import com.sulake.core.window.components.IFrameWindow;
    import com.sulake.core.window.IWindowContainer;
    import __AS3__.vec.Vector;
    import com.sulake.habbo.communication.messages.incoming.nux.NewUserExperienceGiftOptions;
    import com.sulake.habbo.communication.messages.outgoing._Str_428._Str_4584;
    import com.sulake.core.assets.XmlAsset;
    import com.sulake.core.window.IWindow;
    import com.sulake.habbo.communication.messages.incoming.nux.NewUserExperienceGift;
    import com.sulake.core.window.components.ITextWindow;
    import com.sulake.core.window.components.IButtonWindow;
    import com.sulake.core.window.components.IStaticBitmapWrapperWindow;
    import com.sulake.habbo.communication.messages.incoming.nux._Str_5589;
    import com.sulake.habbo.session.product.IProductData;
    import com.sulake.core.window.components.IItemListWindow;
    import com.sulake.core.window.events.WindowMouseEvent;
    import com.sulake.core.window.events.WindowEvent;
    import __AS3__.vec.*;

    public class NuxGiftSelectionView implements IProductDataListener 
    {
        private var _frame:IFrameWindow;
        private var _component:HabboNuxDialogs;
        private var _optionTemplate:IWindowContainer;
        private var _giftOptions:Vector.<NewUserExperienceGiftOptions>;
        private var _currentIndex:int;
        private var _selectedOptions:Vector.<_Str_4584>;

        public function NuxGiftSelectionView(k:HabboNuxDialogs, _arg_2:Vector.<NewUserExperienceGiftOptions>)
        {
            this._component = k;
            this._giftOptions = _arg_2;
            this._currentIndex = 0;
            this._selectedOptions = new Vector.<_Str_4584>();
            if (((this._component.sessionDataManager) && (this._component.sessionDataManager.loadProductData(this))))
            {
                this.show();
            }
        }

        public function productDataReady():void
        {
            this.show();
        }

        public function dispose():void
        {
            if (this._frame)
            {
                this._frame.dispose();
                this._frame = null;
            }
            this._component = null;
            this._optionTemplate = null;
        }

        public function get disposed():Boolean
        {
            return this._component == null;
        }

        private function hide():void
        {
            if (this._component)
            {
                this._component._Str_8646();
            }
        }

        private function show():void
        {
            if (this._frame != null)
            {
                this._frame.dispose();
            }
            var k:XmlAsset = (this._component.assets.getAssetByName("nux_gift_selection_xml") as XmlAsset);
            this._frame = (this._component.windowManager.buildFromXML((k.content as XML)) as IFrameWindow);
            if (this._frame == null)
            {
                throw (new Error("Failed to construct window from XML!"));
            }
            var _local_2:IWindow = this._frame.findChildByTag("close");
            if (_local_2)
            {
                _local_2.visible = false;
            }
            this._Str_24433();
        }

        private function _Str_24433():void
        {
            var _local_5:NewUserExperienceGift;
            var _local_6:IWindowContainer;
            var _local_7:ITextWindow;
            var _local_8:IButtonWindow;
            var _local_9:IWindowContainer;
            var _local_10:IStaticBitmapWrapperWindow;
            var _local_11:String;
            var _local_12:String;
            var _local_13:int;
            var _local_14:_Str_5589;
            var _local_15:String;
            var _local_16:String;
            var _local_17:IProductData;
            if (((!(this._giftOptions)) || (!(this._giftOptions.length))))
            {
                return;
            }
            var k:NewUserExperienceGiftOptions = this._giftOptions[this._currentIndex];
            var _local_2:IItemListWindow = (this._frame.findChildByName("nux_gift_selection_list") as IItemListWindow);
            if (!this._optionTemplate)
            {
                this._optionTemplate = (_local_2.getListItemAt(0) as IWindowContainer);
            }
            _local_2.removeListItems();
            var _local_3:String = decodeURI(this._component.localizationManager.getLocalization("nux.gift.selection.separator", ", "));
            var _local_4:int;
            while (_local_4 < k.options.length)
            {
                _local_5 = k.options[_local_4];
                _local_6 = (this._optionTemplate.clone() as IWindowContainer);
                _local_7 = (_local_6.getChildByName("option_heading") as ITextWindow);
                _local_8 = (_local_6.getChildByName("option_button") as IButtonWindow);
                _local_9 = (_local_6.getChildByName("option_thumbnail") as IWindowContainer);
                _local_10 = (_local_9.getChildByName("option_bitmap") as IStaticBitmapWrapperWindow);
                _local_11 = "";
                if (_local_5._Str_13979.length)
                {
                    _local_13 = 0;
                    while (_local_13 < _local_5._Str_13979.length)
                    {
                        _local_14 = _local_5._Str_13979[_local_13];
                        _local_15 = _local_14.productCode;
                        _local_16 = _local_14._Str_14499;
                        if (_local_16 != null)
                        {
                            _local_11 = (_local_11 + this._component.localizationManager.getLocalization(_local_16, _local_16));
                        }
                        else
                        {
                            _local_17 = this._component.catalog.getProductData(_local_15);
                            if (((_local_17) && (_local_17.name)))
                            {
                                _local_11 = (_local_11 + _local_17.name);
                            }
                            else
                            {
                                _local_11 = (_local_11 + this._component.localizationManager.getLocalization((("product_" + _local_15) + "_name"), (("product_" + _local_15) + "_name")));
                            }
                        }
                        if (_local_13 < (_local_5._Str_13979.length - 1))
                        {
                            _local_11 = (_local_11 + _local_3);
                        }
                        _local_13++;
                    }
                }
                _local_12 = _local_5.roomTemplateName;
                if (_local_12)
                {
                    _local_10.assetUri = (this._component.configuration.getProperty("image.library.url") + _local_12);
                }
                _local_7.text = _local_11;
                _local_8.name = _local_4.toString();
                _local_8.procedure = this._Str_24885;
                _local_2.addListItem(_local_6);
                _local_4++;
            }
            _local_2.arrangeListItems();
            if (this._giftOptions.length > 1)
            {
                this._frame.caption = ((((this._component.localizationManager.getLocalization("nux.gift.selection.title") + " ") + (this._currentIndex + 1)) + "/") + this._giftOptions.length);
            }
            this._frame.center();
        }

        private function _Str_24885(k:WindowEvent, _arg_2:IWindow):void
        {
            var _local_3:NewUserExperienceGiftOptions;
            var _local_4:IItemListWindow;
            var _local_5:int;
            var _local_6:_Str_4584;
            if (k.type == WindowMouseEvent.CLICK)
            {
                _local_3 = this._giftOptions[this._currentIndex];
                _local_4 = (this._frame.findChildByName("nux_gift_selection_list") as IItemListWindow);
                _local_5 = _local_4.getListItemIndex(_arg_2.parent);
                if (_local_5 == -1)
                {
                    return;
                }
                _local_6 = new _Str_4584(_local_3.dayIndex, _local_3.stepIndex, _local_5);
                this._selectedOptions.push(_local_6);
                this._currentIndex++;
                if (this._currentIndex == this._giftOptions.length)
                {
                    this._component._Str_25203(this._selectedOptions);
                }
                else
                {
                    this.show();
                }
            }
        }

        private function onCloseHandler(k:WindowMouseEvent):void
        {
            this.hide();
        }
    }
}








