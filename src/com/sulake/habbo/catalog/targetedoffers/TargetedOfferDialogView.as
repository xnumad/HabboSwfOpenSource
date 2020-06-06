package com.sulake.habbo.catalog.targetedoffers
{
    import com.sulake.habbo.catalog.targetedoffers.data.TargetedOffer;
    import com.sulake.core.window.IWindowContainer;
    import com.sulake.core.window.components.IFrameWindow;
    import com.sulake.core.window.components.ITextWindow;
    import com.sulake.core.utils.Map;
    import com.sulake.core.window.components.IStaticBitmapWrapperWindow;
    import com.sulake.core.runtime.IHabboConfigurationManager;
    import com.sulake.core.window.components.ITextFieldWindow;
    import com.sulake.core.window.events.WindowKeyboardEvent;
    import com.sulake.habbo.catalog.purse.ActivityPointTypeEnum;
    import com.sulake.core.window.IWindow;
    import com.sulake.core.window.components.IItemListWindow;
    import com.sulake.core.window.events.WindowMouseEvent;
    import com.sulake.core.window.events.WindowEvent;
    import flash.text.StyleSheet;

    public class TargetedOfferDialogView extends OfferView 
    {
        private static const _Str_5155:String = "targetedoffers/offer_default.png";

        private var _quantity:int = 1;

        public function TargetedOfferDialogView(k:OfferController, _arg_2:TargetedOffer)
        {
            super(k, _arg_2);
        }

        public function _Str_6297(k:String):void
        {
            var _local_6:String;
            var _local_7:String;
            if (((!(_controller.catalog)) || (!(_controller.catalog.windowManager))))
            {
                return;
            }
            _window = IWindowContainer(_controller.catalog.windowManager.buildFromXML(XML(_controller.catalog.assets.getAssetByName(k).content)));
            if (IFrameWindow(_window))
            {
                IFrameWindow(_window).title.text = getLocalization(_offer.title);
            }
            var _local_2:ITextWindow = ITextWindow(_window.findChildByName("txt_title"));
            if (_local_2)
            {
                _local_2.text = getLocalization(_offer.title);
            }
            _local_2 = ITextWindow(_window.findChildByName("txt_description"));
            if (_local_2)
            {
                _local_2.text = getLocalization(_offer.description);
                this._Str_10740(_local_2);
            }
            _local_2 = ITextWindow(_window.findChildByName("txt_price_label"));
            if (_local_2)
            {
                _local_2.text = getLocalization("targeted.offer.price.label");
            }
            var _local_3:Map = _controller.catalog.utils.getPriceMap(_offer, this._quantity);
            this._Str_23782(_window, _local_3);
            var _local_4:IStaticBitmapWrapperWindow = IStaticBitmapWrapperWindow(_window.findChildByName("bmp_illustration"));
            if (_local_4)
            {
                _local_6 = (_controller.catalog as IHabboConfigurationManager).getProperty("image.library.url");
                _local_7 = this._Str_23626(_offer);
                if (((_local_7 == null) || (_local_7.length == 0)))
                {
                    _local_7 = (((_offer.imageUrl) && (_offer.imageUrl.length > 0)) ? _offer.imageUrl : _Str_5155);
                }
                _local_4.assetUri = (_local_6 + _local_7);
            }
            _Str_5181 = getLocalization("targeted.offer.timeleft", "");
            if (_offer.expirationTime == 0)
            {
                if (_window.findChildByName("cnt_time_left"))
                {
                    _window.findChildByName("cnt_time_left").visible = false;
                }
            }
            else
            {
                _Str_13550();
            }
            var _local_5:ITextFieldWindow = (_window.findChildByName("quantity_input") as ITextFieldWindow);
            if (_local_5)
            {
                _local_5.addEventListener(WindowKeyboardEvent.WINDOW_EVENT_KEY_UP, this._Str_23435);
            }
            _window.procedure = this.onInput;
            _window.center();
            this._Str_20970();
            this._Str_18148();
        }

        private function _Str_23782(k:IWindowContainer, _arg_2:Map):void
        {
            if (k == null)
            {
                return;
            }
            var _local_3:* = _arg_2.getValue("credit");
            k.findChildByName("txt_price_credits").caption = _local_3.amount;
            var _local_4:* = _arg_2.getValue("activityPoint");
            if (_local_4 != null)
            {
                k.findChildByName("txt_price_activityPoints").caption = _local_4.amount;
                this._Str_9646("activityPoints_icon", k, _local_4.activityPointType);
            }
            else
            {
                k.findChildByName("txt_price_activityPoints").caption = "0";
                this._Str_9646("activityPoints_icon", k, ActivityPointTypeEnum.LOYALTY);
            }
        }

        private function _Str_9646(k:String, _arg_2:IWindowContainer, _arg_3:int):void
        {
            var _local_4:IWindow = _arg_2.findChildByName(k);
            _local_4.style = ActivityPointTypeEnum.getIconStyleFor(_arg_3, _controller.catalog, true);
        }

        override protected function setTimeLeft(k:String):void
        {
            var _local_2:ITextWindow = ITextWindow(_window.findChildByName("txt_time_left"));
            if (!_local_2)
            {
                return;
            }
            _local_2.text = k;
            if (!_Str_5181)
            {
                return;
            }
            var _local_3:int = Math.max(_Str_5181.indexOf("%timeleft%"), 0);
            var _local_4:ITextWindow = ITextWindow(_window.findChildByName("txt_time_left_label_1"));
            if (_local_4)
            {
                _local_4.text = _Str_5181.substr(0, (_local_3 - 1));
            }
            _local_4 = ITextWindow(_window.findChildByName("txt_time_left_label_2"));
            if (_local_4)
            {
                _local_4.text = _Str_5181.substr((_local_3 + 10), _Str_5181.length);
            }
        }

        public function _Str_18148():void
        {
            var k:ITextWindow = ITextWindow(_window.findChildByName("txt_status"));
            if (!k)
            {
                return;
            }
            var _local_2:Boolean = _offer.checkPurseBalance(_controller.catalog.getPurse(), this._quantity);
            if (_local_2)
            {
                k.text = "";
            }
            else
            {
                if (_window.findChildByName("btn_buy"))
                {
                    _window.findChildByName("btn_buy").disable();
                }
            }
            if (_window.findChildByName("cnt_quantity"))
            {
                _window.findChildByName("cnt_quantity").visible = (_offer.purchaseLimit > 1);
            }
            if (_window.findChildByName("btn_get_credits"))
            {
                _window.findChildByName("btn_get_credits").visible = (!(_local_2));
            }
            var _local_3:IWindow = _window.findChildByName("btn_buy");
            if (_local_3)
            {
                if (((_local_2) && (this._Str_19566())))
                {
                    _local_3.enable();
                }
                else
                {
                    _local_3.disable();
                }
            }
            var _local_4:IItemListWindow = IItemListWindow(_window.findChildByName("itemlist_buttonbar"));
            if (_local_4)
            {
                _local_4.arrangeListItems();
                _local_4.arrangeListItems();
            }
        }

        private function _Str_20970():void
        {
            var k:ITextWindow = ITextWindow(_window.findChildByName("txt_price_credits"));
            if (k)
            {
                k.text = ((this._quantity * _offer.priceInCredits) + "");
            }
            var _local_2:ITextWindow = ITextWindow(_window.findChildByName("txt_price_activityPoints"));
            if (_local_2)
            {
                _local_2.text = ((this._quantity * _offer.priceInActivityPoints) + "");
            }
        }

        private function onInput(k:WindowEvent, _arg_2:IWindow):void
        {
            if (!_controller)
            {
                return;
            }
            if (k.type == WindowMouseEvent.DOWN)
            {
                switch (_arg_2.name)
                {
                    case "header_button_close":
                        _controller.minimizeOffer(_offer);
                        return;
                    case "btn_get_credits":
                        _controller.purchaseCredits(_offer);
                        return;
                    case "btn_buy":
                        if (!this._Str_19566())
                        {
                            return;
                        }
                        _controller.showConfirmation(_offer, this._quantity);
                        return;
                }
            }
        }

        private function _Str_19566():Boolean
        {
            return (this._quantity >= 1) && (this._quantity <= _offer.purchaseLimit);
        }

        private function _Str_23435(k:WindowKeyboardEvent):void
        {
            var _local_2:int = parseInt(k.target.caption);
            if (((((_local_2 == 0) && (!(k.target.caption == ""))) || (_local_2 > 999)) || (_local_2 > _offer.purchaseLimit)))
            {
                k.target.caption = this._quantity.toString();
                return;
            }
            this._quantity = _local_2;
            this._Str_20970();
            this._Str_18148();
        }

        private function _Str_10740(k:ITextWindow):void
        {
            if (!k)
            {
                return;
            }
            var _local_2:StyleSheet = new StyleSheet();
            var _local_3:Object = new Object();
            _local_3.textDecoration = "underline";
            _local_2.setStyle("a:link", _local_3);
            k.styleSheet = _local_2;
        }

        private function _Str_23626(k:TargetedOffer):String
        {
            return _controller.catalog.getProperty(("targeted.offer.override.preview_image." + k.id));
        }
    }
}
