package com.sulake.habbo.ui.widget.furniture.credit
{
    import com.sulake.habbo.ui.widget.ConversionTrackingWidget;
    import com.sulake.core.window.IWindowContainer;
    import com.sulake.habbo.ui.IRoomWidgetHandler;
    import com.sulake.habbo.window.IHabboWindowManager;
    import com.sulake.core.assets.IAssetLibrary;
    import com.sulake.habbo.localization.IHabboLocalizationManager;
    import com.sulake.habbo.ui.widget.events._Str_4899;
    import flash.events.IEventDispatcher;
    import com.sulake.core.window.IWindow;
    import com.sulake.core.assets.IAsset;
    import com.sulake.core.assets.XmlAsset;
    import com.sulake.core.window.enum.WindowType;
    import com.sulake.habbo.window.enum._Str_3108;
    import com.sulake.core.window.enum.WindowParam;
    import flash.geom.Rectangle;
    import com.sulake.core.window.events.WindowMouseEvent;
    import com.sulake.habbo.ui.widget.messages.RoomWidgetCreditFurniRedeemMessage;
    import com.sulake.habbo.utils.HabboWebTools;
    import com.sulake.core.window.events.WindowEvent;

    public class CreditFurniWidget extends ConversionTrackingWidget 
    {
        private static const _Str_4126:Number = 100;
        private static const _Str_4162:Number = 100;

        private var _window:IWindowContainer;
        private var _Str_10662:int = -1;
        private var _value:Number;
		private var _furniType:String;

        public function CreditFurniWidget(k:IRoomWidgetHandler, _arg_2:IHabboWindowManager, _arg_3:IAssetLibrary, _arg_4:IHabboLocalizationManager)
        {
            super(k, _arg_2, _arg_3, _arg_4);
        }

        override public function dispose():void
        {
            this._Str_2718();
            super.dispose();
        }

        override public function registerUpdateEvents(k:IEventDispatcher):void
        {
            if (k == null)
            {
                return;
            }
            k.addEventListener(_Str_4899.RWCFUE_CREDIT_FURNI_UPDATE, this.onObjectUpdate);
            super.registerUpdateEvents(k);
        }

        override public function unregisterUpdateEvents(k:IEventDispatcher):void
        {
            if (k == null)
            {
                return;
            }
            k.removeEventListener(_Str_4899.RWCFUE_CREDIT_FURNI_UPDATE, this.onObjectUpdate);
        }

        private function onObjectUpdate(k:_Str_4899):void
        {
            this._Str_2718();
            this._Str_10662 = k._Str_1577;
            this._value = k._Str_22599;
			this._furniType = k.furniType;
            this._Str_3030();
        }

        private function _Str_3030():void
        {
            var _local_3:IWindow;
            if (this._Str_10662 == -1)
            {
                return;
            }
            if (this._window != null)
            {
                this._window.dispose();
                this._window = null;
            }
			
			/*var currency:String = "credits";
			var parts:Array = this._furniType.split("_");
			
			if (parts[0] == "PF")
			{
				if (parts.length >= 2)
				{
					currency = ("achievements.activitypoint.0");
					this._value = parts[1];
				}
			}
			else if (parts[0] == "DF")
			{
				if (parts.length >= 3 )
				{
					currency = ("achievements.activitypoint." + parts[1]);
					this._value = parts[2];
				}
			}
			
			this._furniType = localizations.getLocalization(currency);*/
			
            windowManager.registerLocalizationParameter("widgets.furniture.credit.redeem.value", "value", String(this._value));
			windowManager.registerLocalizationParameter("widgets.furniture.credit.redeem.value", "type", this._furniType);
			
            var k:IAsset = assets.getAssetByName("credit_redeem");
            var _local_2:XmlAsset = XmlAsset(k);
            if (_local_2 == null)
            {
                return;
            }
            this._window = (windowManager.createWindow("creditfurniui_container", "", WindowType.WINDOW_TYPE_CONTAINER, _Str_3108.DEFAULT, (WindowParam.WINDOW_PARAM_EXPAND_TO_ACCOMMODATE_CHILDREN | WindowParam.WINDOW_PARAM_INPUT_EVENT_PROCESSOR), new Rectangle(_Str_4126, _Str_4162, 2, 2), null, 0) as IWindowContainer);
            this._window.buildFromXML(XML(_local_2.content));
            this._window.background = true;
            this._window.color = 33554431;
            _local_3 = this._window.findChildByName("cancel");
            if (_local_3 != null)
            {
                _local_3.addEventListener(WindowMouseEvent.CLICK, this._Str_3132);
            }
            _local_3 = this._window.findChildByName("exchange");
            if (_local_3 != null)
            {
                _local_3.addEventListener(WindowMouseEvent.CLICK, this._Str_3132);
            }
            _local_3 = this._window.findChildByName("link");
            if (_local_3 != null)
            {
                _local_3.addEventListener(WindowMouseEvent.CLICK, this._Str_3132);
            }
            _local_3 = this._window.findChildByTag("close");
            if (_local_3 != null)
            {
                _local_3.procedure = this._Str_3046;
            }
            this._window.addEventListener(WindowMouseEvent.CLICK, this._Str_3132);
        }

        private function _Str_2718():void
        {
            if (this._window != null)
            {
                this._window.dispose();
                this._window = null;
            }
            this._Str_10662 = -1;
            this._value = 0;
        }

        private function _Str_25731():void
        {
            var k:RoomWidgetCreditFurniRedeemMessage;
            if (this._Str_10662 == -1)
            {
                return;
            }
            if (messageListener != null)
            {
                k = new RoomWidgetCreditFurniRedeemMessage(RoomWidgetCreditFurniRedeemMessage.RWFCRM_REDEEM, this._Str_10662);
                messageListener.processWidgetMessage(k);
                this._Str_2718();
            }
        }

        private function _Str_3132(k:WindowMouseEvent):void
        {
            var _local_4:String;
            var _local_2:IWindow = (k.target as IWindow);
            var _local_3:String = _local_2.name;
            switch (_local_3)
            {
                case "link":
                    _local_4 = localizations.getLocalization("widget.furni.info.url");
                    if (_local_4.indexOf("http") == 0)
                    {
                        HabboWebTools.navigateToURL(_local_4, "habboMain");
                    }
                    return;
                case "exchange":
                    this._Str_25731();
                    return;
                case "cancel":
                case "close":
                    this._Str_2718();
                    return;
            }
        }

        private function _Str_3046(k:WindowEvent, _arg_2:IWindow):void
        {
            if (k.type != WindowMouseEvent.CLICK)
            {
                return;
            }
            this._Str_2718();
        }
    }
}
