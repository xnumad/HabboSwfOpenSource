package com.sulake.habbo.friendbar.landingview.layout
{
    import com.sulake.core.runtime.IUpdateReceiver;
    import com.sulake.habbo.friendbar.landingview.HabboLandingView;
    import com.sulake.core.window.IWindowContainer;
    import com.sulake.core.window.components.ITextWindow;
    import com.sulake.habbo.communication.messages.incoming.competition._Str_4748;
    import com.sulake.core.window.events.WindowEvent;
    import com.sulake.habbo.communication.messages.outgoing._Str_301._Str_5974;
    import flash.geom.Point;
    import com.sulake.core.window.IWindow;
    import flash.geom.Rectangle;
    import com.sulake.core.window.components.IStaticBitmapWrapperWindow;
    import com.sulake.habbo.friendbar.landingview.interfaces.ILandingViewWidget;
    import com.sulake.habbo.friendbar.landingview.interfaces.ISlotAwareWidget;

    public class _Str_3695 implements IUpdateReceiver 
    {
        private static const COLORABLE:String = "COLORABLE";
        private static const _Str_3446:int = 0;
        private static const LANDING_VIEW_DEFAULT_DYNAMIC_LAYOUT:String = "landing_view_default_dynamic_layout";
        private static const LANDING_VIEW_GENERIC_RECEPTION:String = "landing_view_generic_reception";
        private static const WIDGET_PLACEHOLDER_:String = "widget_placeholder_";
        private static const _Str_16487:Array = ["background_back", "background_front", "background_gradient_top", "background_hotel_top", "background_gradient", "background_right", "background_horizon", "background_left", "background_left_bottom"];

        protected var habboLandingView:HabboLandingView;
        protected var windowContainer:IWindowContainer;
        protected var dynamicLayoutManager:DynamicLayoutManager;
        protected var movingBackgroundObjects:MovingBackgroundObjects;
        protected var _Str_19814:int;
        protected var _Str_20591:int;
        private var _registeredWidgets:Array;
        private var _Str_3157:_Str_3198;
        private var _Str_4271:String;

        public function _Str_3695(k:HabboLandingView)
        {
            this._registeredWidgets = [];
            super();
            this.habboLandingView = k;
            this._Str_22860();
            this.movingBackgroundObjects = new MovingBackgroundObjects(this.landingView);
            this._Str_3157 = new _Str_3198(this.landingView);
            k.registerUpdateReceiver(this, 1000);
        }

        private static function findColorableChildren(k:IWindowContainer):Array
        {
            var colorableChildren:Array = new Array(0);
            k.groupChildrenWithTag(COLORABLE, colorableChildren, -1);
            return colorableChildren;
        }

        public static function _Str_26034(search:IWindowContainer, newTextColor:uint):void
        {
            var textWindow:ITextWindow;
            if (search == null)
            {
                return;
            }
            for each (textWindow in findColorableChildren(search))
            {
                textWindow.textColor = newTextColor;
            }
        }

        public static function _Str_26390(search:IWindowContainer, newEtchingColor:uint):void
        {
            var textWindow:ITextWindow;
            if (search == null)
            {
                return;
            }
            for each (textWindow in findColorableChildren(search))
            {
                textWindow.etchingColor = newEtchingColor;
            }
        }

        public static function _Str_26344(search:IWindowContainer, newEtchingPosition:String):void
        {
            var textWindow:ITextWindow;
            if (search == null)
            {
                return;
            }
            for each (textWindow in findColorableChildren(search))
            {
                textWindow.etchingPosition = newEtchingPosition;
            }
        }

        public static function _Str_5630(search:IWindowContainer, _arg_2:_Str_3198):void
        {
            var _local_3:ITextWindow;
            if (search == null)
            {
                return;
            }
            if ((((_arg_2._Str_16938) || (_arg_2._Str_16698)) || (_arg_2._Str_18420)))
            {
                for each (_local_3 in findColorableChildren(search))
                {
                    _local_3.textColor = ((_arg_2._Str_16938) ? _arg_2.textColor : _local_3.textColor);
                    _local_3.etchingColor = ((_arg_2._Str_16698) ? _arg_2.etchingColor : _local_3.etchingColor);
                    _local_3.etchingPosition = ((_arg_2._Str_18420) ? _arg_2.etchingPosition : _local_3.etchingPosition);
                }
            }
        }


        public function update(k:uint):void
        {
            if (((!(this.windowContainer == null)) && (this.windowContainer.visible)))
            {
                this.movingBackgroundObjects.update(k);
            }
        }

        public function get disposed():Boolean
        {
            return this.landingView == null;
        }

        public function dispose():void
        {
            var registeredWidget:WidgetPlaceholder;
            if (this.landingView)
            {
                this.landingView.removeUpdateReceiver(this);
            }
            this.habboLandingView = null;
            if (this.windowContainer)
            {
                this.windowContainer.dispose();
                this.windowContainer = null;
            }
            if (this._registeredWidgets)
            {
                for each (registeredWidget in this._registeredWidgets)
                {
                    registeredWidget.dispose();
                }
                this._registeredWidgets = null;
            }
            if (this.movingBackgroundObjects)
            {
                this.movingBackgroundObjects.dispose();
                this.movingBackgroundObjects = null;
            }
            if (this.dynamicLayoutManager)
            {
                this.dynamicLayoutManager.dispose();
                this.dynamicLayoutManager = null;
            }
            if (this._Str_3157)
            {
                this._Str_3157 = null;
            }
        }

        public function activate():void
        {
            var registeredWidget:WidgetPlaceholder;
            if (this.windowContainer == null)
            {
                this.createWindow();
                this.initializeDynamicWidgetList();
                this.landingView.communicationManager.addHabboConnectionMessageEvent(new _Str_4748(this._Str_12291));
                this._Str_4271 = this.landingView.getProperty("landing.view.bgtiming");
            }
            for each (registeredWidget in this._registeredWidgets)
            {
                registeredWidget.refresh(this.windowContainer);
            }
            this._Str_5127();
            this.landingView.windowManager.getWindowContext(_Str_3446).getDesktopWindow().addEventListener(WindowEvent.WINDOW_EVENT_RESIZED, this._Str_3630);
            this.windowContainer.invalidate();
            if (this._Str_21419 != null)
            {
                this.landingView.navigator.openNavigator(this._Str_21419);
            }
            this.landingView.send(new _Str_5974(this._Str_4271));
            this.windowContainer.visible = true;
        }

        private function get _Str_21419():Point
        {
            var point:Point;
            var placer:IWindow = this.windowContainer.findChildByName("navigator_placer");
            if (placer == null)
            {
                return null;
            }
            point = new Point();
            placer.getGlobalPosition(point);
            return point;
        }

        public function disable():void
        {
            var registeredWidget:WidgetPlaceholder;
            if (this.windowContainer != null)
            {
                this.windowContainer.visible = false;
            }
            for each (registeredWidget in this._registeredWidgets)
            {
                registeredWidget.disable();
            }
        }

        protected function createWindow():void
        {
            if (this.windowContainer != null)
            {
                return;
            }
            var k:String = this._Str_14617();
            this.windowContainer = IWindowContainer(this.landingView.getXmlWindow(k, 0));
            this._Str_23921();
            if (this.landingView.getBoolean("landing.view.right_pane_dimmer.hidden"))
            {
                if (this.windowContainer.findChildByName("right_pane_dimmer") != null)
                {
                    this.windowContainer.findChildByName("right_pane_dimmer").visible = false;
                }
            }
            this._Str_25199();
            this._Str_25610();
        }

        private function _Str_23921():void
        {
            var k:IWindow = this.windowContainer.findChildByName("warning");
            if (k != null)
            {
                k.visible = false;
            }
        }

        protected function _Str_25199():void
        {
            this._Str_19814 = this.windowContainer.width;
            this._Str_20591 = this.windowContainer.height;
        }

        protected function _Str_25610():void
        {
            var _local_2:String;
            var k:IWindow = this.windowContainer.findChildByName("widget_placeholder_bottom_slot");
            if (k != null)
            {
                _local_2 = this.landingView.getProperty("landing.view.dynamic.slot.6.widget");
                if (_local_2 == "")
                {
                    k.visible = false;
                }
                else
                {
                    k.name = ("widget_placeholder_" + _local_2);
                }
            }
        }

        private function _Str_14617():String
        {
            return (this.landingView.propertyExists("landing.view.layoutxml")) ? this.landingView.getProperty("landing.view.layoutxml") : LANDING_VIEW_DEFAULT_DYNAMIC_LAYOUT;
        }

        private function _Str_24641():Boolean
        {
            return this._Str_14617() == LANDING_VIEW_GENERIC_RECEPTION;
        }

        protected function _Str_5127():void
        {
            var k:WidgetPlaceholder;
            if (this.windowContainer != null)
            {
                if (this.dynamicLayoutManager != null)
                {
                    this._Str_24915();
                }
                else
                {
                    this._Str_23814();
                }
                this.windowContainer.invalidate();
            }
            for each (k in this._registeredWidgets)
            {
                k._Str_17674();
            }
        }

        private function _Str_24915():void
        {
            var k:Rectangle = this.windowContainer.desktop.rectangle;
            this.windowContainer.width = k.width;
            this.windowContainer.height = k.height;
            var _local_2:int = (this._Str_20591 - k.height);
            var _local_3:int = (this._Str_19814 - k.width);
            this.dynamicLayoutManager._Str_24842((this.dynamicLayoutManager._Str_19568 - _local_3), (this.dynamicLayoutManager._Str_19625 - _local_2));
            this.dynamicLayoutManager._Str_22592 = Math.min(this.windowContainer.width, (k.width + this.window.x));
        }

        private function _Str_23814():void
        {
            this.windowContainer.x = 0;
            this.windowContainer.y = 0;
            var k:Rectangle = this.windowContainer.desktop.rectangle;
            this.windowContainer.x = Math.max(0, ((k.width - this.windowContainer.width) / 2));
            if (((k.height > this.windowContainer.height) || (this._Str_24641())))
            {
                this.windowContainer.y = Math.max(0, ((k.height - this.windowContainer.height) / 2));
            }
            else
            {
                this.windowContainer.y = (k.height - this.windowContainer.height);
            }
        }

        protected function _Str_3630(k:WindowEvent):void
        {
            this._Str_5127();
        }

        private function _Str_22475(k:String):void
        {
            var _local_2:String;
            var _local_3:IStaticBitmapWrapperWindow;
            var _local_4:String;
            k = (((k == null) || (k == "")) ? "" : (k + "."));
            for each (_local_2 in _Str_16487)
            {
                _local_3 = IStaticBitmapWrapperWindow(this.windowContainer.findChildByName(_local_2));
                if (_local_3)
                {
                    if (this.landingView.getProperty(((("landing.view." + k) + _local_2) + ".visible")) == "false")
                    {
                        _local_3.visible = false;
                    }
                    else
                    {
                        _local_3.visible = true;
                        _local_4 = this.landingView.getProperty(((("landing.view." + k) + _local_2) + ".uri"), null);
                        if ((((!(_local_3.assetUri == _local_4)) && (!(_local_4 == null))) && (!(_local_4 == ""))))
                        {
                            _local_3.assetUri = _local_4;
                        }
                    }
                }
            }
        }

        private function _Str_22860():void
        {
            this.addWidgetPlaceholder(HabboLandingViewWidgets.AVATAR_IMAGE);
            this.addWidgetPlaceholder(HabboLandingViewWidgets.EXPIRING_CATALOG_PAGE);
            this.addWidgetPlaceholder(HabboLandingViewWidgets.EXPIRING_CATALOG_PAGE_SMALL);
            this.addWidgetPlaceholder(HabboLandingViewWidgets.COMMUNITY_GOAL);
            this.addWidgetPlaceholder(HabboLandingViewWidgets.CATALOG_PROMO);
            this.addWidgetPlaceholder(HabboLandingViewWidgets.ACHIEVEMENT_COMPETITION_HALL_OF_FAME);
            this.addWidgetPlaceholder(HabboLandingViewWidgets.ACHIEVEMENT_COMPETITION_PRIZES);
            this.addWidgetPlaceholder(HabboLandingViewWidgets.DAILYQUEST);
            this.addWidgetPlaceholder(HabboLandingViewWidgets.NEXT_LIMITED_RARE_COUNTDOWN);
            this.addWidgetPlaceholder(HabboLandingViewWidgets.HABBO_MODERATION_PROMO);
            this.addWidgetPlaceholder(HabboLandingViewWidgets.HABBO_TALENTS_PROMO);
            this.addWidgetPlaceholder(HabboLandingViewWidgets.HABBO_WAY_PROMO);
            this.addWidgetPlaceholder(HabboLandingViewWidgets.FASTFOOD_GAME_PROMO);
            this.addWidgetPlaceholder(HabboLandingViewWidgets.SAFETY_QUIZ_PROMO);
            this.addWidgetPlaceholder(HabboLandingViewWidgets.GENERIC);
            this.addWidgetPlaceholder(HabboLandingViewWidgets.WIDGET_CONTAINER);
        }

        private function addWidgetPlaceholder(widgetCode:String):void
        {
            var widget:ILandingViewWidget = HabboLandingViewWidgets.createWidget(widgetCode, this.landingView);
            this._registeredWidgets.push(new WidgetPlaceholder(widget, (WIDGET_PLACEHOLDER_ + widgetCode), this._Str_3157));
        }

        private function initializeDynamicWidgetList():void
        {
            var _local_2:String;
            var widget:ILandingViewWidget;
            if (this.windowContainer.findChildByName(DynamicLayoutManager.PLACEHOLDER_DYNAMIC_WIDGET_SLOTS) == null)
            {
                Logger.log("ERROR! Tried to initialize dynamic widget list for landing view without the dynamic element present");
                return;
            }
            this.dynamicLayoutManager = new DynamicLayoutManager(this, this._Str_3157);
            var k:int;
            while (k < 6)
            {
                _local_2 = this.landingView.getProperty((("landing.view.dynamic.slot." + (k + 1)) + ".widget"), null);
                widget = HabboLandingViewWidgets.createWidget(_local_2, this.landingView);
                if (widget != null)
                {
                    if ((widget is ISlotAwareWidget))
                    {
                        ISlotAwareWidget(widget).slot = (k + 1);
                    }
                    this._registeredWidgets.push(new WidgetPlaceholder(widget, null, this._Str_3157, this.dynamicLayoutManager._Str_23980(k)));
                }
                k++;
            }
            if (this.landingView.getBoolean("landing.view.dynamic.slot.5.ignore"))
            {
                this.dynamicLayoutManager._Str_24583 = true;
            }
            if (this.landingView.getBoolean("landing.view.dynamic.slot.4.separator"))
            {
                this.dynamicLayoutManager._Str_20363(4, this.landingView.getProperty("landing.view.dynamic.slot.4.title"));
            }
            if (this.landingView.getBoolean("landing.view.dynamic.slot.5.separator"))
            {
                this.dynamicLayoutManager._Str_20363(5, this.landingView.getProperty("landing.view.dynamic.slot.5.title"));
            }
        }

        public function get window():IWindowContainer
        {
            return this.windowContainer;
        }

        public function get landingView():HabboLandingView
        {
            return this.habboLandingView;
        }

        private function _Str_12291(k:_Str_4748):void
        {
            if (((k.getParser()._Str_18517 == this._Str_4271) && (this.landingView)))
            {
                this._Str_22475(k.getParser().code);
                this.movingBackgroundObjects._Str_23132 = k.getParser().code;
                this.movingBackgroundObjects.initialize(this.windowContainer);
            }
        }
    }
}
