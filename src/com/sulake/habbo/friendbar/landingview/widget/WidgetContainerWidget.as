package com.sulake.habbo.friendbar.landingview.widget
{
    import com.sulake.habbo.friendbar.landingview.interfaces.ILandingViewWidget;
    import com.sulake.habbo.friendbar.landingview.interfaces.ISlotAwareWidget;
    import com.sulake.habbo.friendbar.landingview.HabboLandingView;
    import com.sulake.core.window.IWindowContainer;
    import flash.utils.Dictionary;
    import com.sulake.habbo.friendbar.landingview.layout._Str_3198;
    import com.sulake.habbo.friendbar.landingview.layout.WidgetPlaceholder;
    import com.sulake.core.window.IWindow;
    import com.sulake.habbo.communication.messages.incoming.competition._Str_4748;
    import com.sulake.habbo.communication.messages.outgoing._Str_301._Str_5974;
    import com.sulake.habbo.friendbar.landingview.layout.HabboLandingViewWidgets;
    import com.sulake.habbo.friendbar.landingview.interfaces._Str_6397;
    import com.sulake.habbo.friendbar.landingview.*;

    public class WidgetContainerWidget implements ILandingViewWidget, ISlotAwareWidget 
    {
        private var _landingView:HabboLandingView;
        private var _container:IWindowContainer;
        private var _widgets:Dictionary;
        private var _commonWidgetSettings:_Str_3198;
        private var _slot:int;
        private var _schedulingStr:String;
        private var _currentWidget:WidgetPlaceholder;

        public function WidgetContainerWidget(k:HabboLandingView)
        {
            this._widgets = new Dictionary();
            super();
            this._landingView = k;
        }

        public static function _Str_2930(k:IWindowContainer):void
        {
            var _local_2:int;
            while (_local_2 < k.numChildren)
            {
                k.getChildAt(_local_2).visible = false;
                _local_2++;
            }
        }


        public function set slot(k:int):void
        {
            this._slot = k;
        }

        public function get container():IWindow
        {
            return this._container;
        }

        public function dispose():void
        {
            this._landingView = null;
            this._container = null;
        }

        public function initialize():void
        {
            this._container = IWindowContainer(this._landingView.getXmlWindow("widget_container_widget"));
            this._commonWidgetSettings = new _Str_3198(this._landingView);
            this._landingView.communicationManager.addHabboConnectionMessageEvent(new _Str_4748(this._Str_12291));
            this._schedulingStr = this._landingView.getProperty((("landing.view.dynamic.slot." + this._slot) + ".conf"));
        }

        public function refresh():void
        {
            this._landingView.send(new _Str_5974(this._schedulingStr));
        }

        public function get disposed():Boolean
        {
            return this._landingView == null;
        }

        private function refreshContent():void
        {
            _Str_2930(this._container);
            if (this._currentWidget != null)
            {
                this._currentWidget.refresh(this._container);
                this._currentWidget.container.visible = true;
                this._container.height = this._currentWidget.container.height;
                this._container.width = this._currentWidget.container.width;
            }
        }

        private function _Str_22575(k:String):WidgetPlaceholder
        {
            var _local_2:String = this._landingView.getProperty((("landing.view." + k) + ".widget"));
            var _local_3:ILandingViewWidget = HabboLandingViewWidgets.createWidget(_local_2, this._landingView);
            if (_local_3 == null)
            {
                return null;
            }
            if ((_local_3 is ISlotAwareWidget))
            {
                ISlotAwareWidget(_local_3).slot = this._slot;
            }
            if ((_local_3 is _Str_6397))
            {
                _Str_6397(_local_3)._Str_12275 = k;
            }
            var _local_4:WidgetPlaceholder = new WidgetPlaceholder(_local_3, null, this._commonWidgetSettings, this._container);
            this._widgets[k] = _local_4;
            return _local_4;
        }

        private function _Str_12291(k:_Str_4748):void
        {
            if (((k.getParser()._Str_18517 == this._schedulingStr) && (!(this.disposed))))
            {
                this._Str_22315(k.getParser().code);
                this.refreshContent();
            }
        }

        private function _Str_22315(k:String):void
        {
            if (k == "")
            {
                this._currentWidget = null;
                return;
            }
            var _local_2:WidgetPlaceholder = this._widgets[k];
            if (_local_2 == null)
            {
                _local_2 = this._Str_22575(k);
            }
            this._currentWidget = _local_2;
        }
    }
}
