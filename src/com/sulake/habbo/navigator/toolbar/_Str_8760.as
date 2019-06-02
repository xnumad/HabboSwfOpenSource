package com.sulake.habbo.navigator.toolbar
{
    import com.sulake.habbo.navigator.HabboNavigator;
    import com.sulake.habbo.localization.IHabboLocalizationManager;
    import com.sulake.core.window.IWindowContainer;
    import com.sulake.core.window.components.IItemListWindow;
    import flash.utils.Timer;
    import com.sulake.core.window.events.WindowMouseEvent;
    import com.sulake.habbo.communication.messages.outgoing._Str_57._Str_7214;
    import com.sulake.core.window.components.ITextWindow;
    import flash.geom.Point;
    import flash.events.TimerEvent;
    import flash.events.Event;
    import com.sulake.core.window.components.IRegionWindow;
    import com.sulake.core.window.components.IBorderWindow;

    public class _Str_8760 
    {
        private static const _Str_18494:uint = 7433577;
        private static const _Str_18752:uint = 5723213;

        private const _Str_24574:String = "item_list";
        private const _Str_22393:String = "SIMPLE_ITEM";

        private var _disposed:Boolean;
        private var _habboNavigator:HabboNavigator;
        private var _localizationManager:IHabboLocalizationManager;
        private var _window:IWindowContainer;
        private var _Str_1929:IItemListWindow;
        private var _Str_13051:IWindowContainer;
        private var _Str_4789:Timer;
        private var _Str_7476:Boolean;

        public function _Str_8760(k:HabboNavigator)
        {
            this._habboNavigator = k;
            this._localizationManager = k.localization;
            this._window = IWindowContainer(this._habboNavigator.getXmlWindow("toolbar_hover"));
            this._Str_1929 = IItemListWindow(this._window.findChildByName(this._Str_24574));
            this._Str_13051 = IWindowContainer(this._Str_1929.getListItemByTag(this._Str_22393));
            this._Str_1929.removeListItem(this._Str_13051);
            this._window.addEventListener(WindowMouseEvent.OVER, this._Str_19268);
            this._window.addEventListener(WindowMouseEvent.HOVERING, this._Str_19268);
            this._window.addEventListener(WindowMouseEvent.OUT, this._Str_20048);
            this._Str_9244("navigator", "${navigator.title}", this._Str_23296);
            this._Str_9244("home", "${toolbar.icon.label.exitroom.home}", this._Str_23229);
            this._Str_9244("favorites", "${navigator.navisel.myfavourites}", this._Str_26475);
            this._Str_9244("create", "${navigator.createroom.create}", this._Str_18652);
            this._Str_9244("history", "${navigator.navisel.visitedrooms}", this._Str_23602);
            this._Str_9244("frequent", "${navigator.navisel.frequentvisits}", this._Str_24692);
        }

        public function dispose():void
        {
            this._disposed = true;
            if (this._Str_4789)
            {
                this._Str_4789.reset();
                this._Str_4789 = null;
            }
            this._Str_1929 = null;
            this._window = null;
            this._Str_13051 = null;
            this._habboNavigator = null;
            this._localizationManager = null;
        }

        private function _Str_23296(k:WindowMouseEvent):void
        {
            this._habboNavigator.openNavigator();
            this._habboNavigator._Str_10330();
            this._Str_8696();
        }

        private function _Str_23229(k:WindowMouseEvent):void
        {
            var _local_2:int = this._habboNavigator.data.homeRoomId;
            if (_local_2 > -1)
            {
                this._habboNavigator.goToPrivateRoom(_local_2);
                this._Str_8696();
            }
        }

        private function _Str_26475(k:WindowMouseEvent):void
        {
            this._habboNavigator._Str_18427();
            this._Str_8696();
        }

        private function _Str_18652(k:WindowMouseEvent):void
        {
            this._habboNavigator.send(new _Str_7214());
            this._Str_8696();
        }

        private function _Str_23602(k:WindowMouseEvent):void
        {
            this._habboNavigator._Str_16885();
            this._Str_8696();
        }

        private function _Str_24692(k:WindowMouseEvent):void
        {
            this._habboNavigator._Str_17131();
            this._Str_8696();
        }

        private function _Str_9244(k:String, _arg_2:String, _arg_3:Function):void
        {
            var _local_4:IWindowContainer = IWindowContainer(this._Str_13051.clone());
            _local_4.name = k;
            (_local_4.getChildByName("text") as ITextWindow).text = _arg_2;
            _local_4.addEventListener(WindowMouseEvent.CLICK, _arg_3);
            _local_4.addEventListener(WindowMouseEvent.OVER, this._Str_20179);
            _local_4.addEventListener(WindowMouseEvent.OUT, this._Str_20179);
            this._Str_1929.addListItem(_local_4);
        }

        public function show(k:Point):void
        {
            this._Str_17438();
            this._window.visible = true;
            this._window.position = k;
        }

        public function _Str_14093():void
        {
            if (((this._disposed) || (this._Str_7476)))
            {
                return;
            }
            this._Str_25410();
        }

        public function _Str_8696():void
        {
            if (this._disposed)
            {
                return;
            }
            this._Str_17438();
            this._Str_7476 = false;
            this._window.visible = false;
        }

        public function hide():void
        {
            if (((this._disposed) || (this._Str_7476)))
            {
                return;
            }
            this._Str_17438();
            this._Str_7476 = false;
            this._window.visible = false;
        }

        private function _Str_25410():void
        {
            if (!this._Str_4789)
            {
                this._Str_4789 = new Timer(500, 1);
                this._Str_4789.addEventListener(TimerEvent.TIMER_COMPLETE, this.onTimerComplete);
                this._Str_4789.start();
            }
            else
            {
                this._Str_4789.reset();
                this._Str_4789.start();
            }
        }

        private function _Str_17438():void
        {
            if (((this._Str_4789) && (this._Str_4789.running)))
            {
                this._Str_4789.reset();
            }
        }

        private function onTimerComplete(k:Event):void
        {
            this.hide();
        }

        private function _Str_20179(k:WindowMouseEvent):void
        {
            var _local_4:Boolean;
            var _local_2:IRegionWindow = IRegionWindow(k.target);
            var _local_3:IBorderWindow = IBorderWindow(_local_2.findChildByName("background"));
            if (_local_3)
            {
                _local_4 = (k.type == WindowMouseEvent.OVER);
                _local_3.color = ((_local_4) ? _Str_18494 : _Str_18752);
                this._Str_20048(k);
            }
        }

        private function _Str_19268(k:WindowMouseEvent):void
        {
            this._Str_7476 = true;
        }

        private function _Str_20048(k:WindowMouseEvent):void
        {
            if (this._window.hitTestGlobalPoint(new Point(k.stageX, k.stageY)))
            {
                this._Str_7476 = true;
                return;
            }
            this._Str_7476 = false;
            this._Str_14093();
        }
    }
}
