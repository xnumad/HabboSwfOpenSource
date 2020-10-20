package com.sulake.habbo.friendbar.landingview.layout
{
    import com.sulake.core.runtime.IDisposable;
    import com.sulake.habbo.friendbar.landingview.interfaces.ILandingViewWidget;
    import com.sulake.core.window.IWindowContainer;
    import com.sulake.core.window.IWindow;
    import com.sulake.habbo.friendbar.landingview.interfaces.ISettingsAwareWidget;
    import com.sulake.habbo.friendbar.landingview.interfaces._Str_10584;
    import com.sulake.habbo.friendbar.landingview.interfaces.IDisableAwareWidget;

    public class WidgetPlaceholder implements IDisposable 
    {
        private var _widget:ILandingViewWidget;
        private var _Str_17931:String;
        private var _Str_18534:IWindowContainer;
        private var _initialized:Boolean;
        private var _commonWidgetSettings:CommonWidgetSettings;

        public function WidgetPlaceholder(k:ILandingViewWidget, _arg_2:String, _arg_3:CommonWidgetSettings, _arg_4:IWindowContainer=null)
        {
            this._widget = k;
            this._Str_17931 = _arg_2;
            this._commonWidgetSettings = _arg_3;
            this._Str_18534 = _arg_4;
        }

        public function dispose():void
        {
            if (this._widget)
            {
                this._widget.dispose();
                this._widget = null;
            }
            if (this._commonWidgetSettings)
            {
                this._commonWidgetSettings = null;
            }
        }

        public function get disposed():Boolean
        {
            return (this._widget == null) && (this._commonWidgetSettings == null);
        }

        public function refresh(k:IWindowContainer):void
        {
            var _local_3:IWindow;
            var _local_2:IWindowContainer = IWindowContainer(k.findChildByName("content_background"));
            if (!this._initialized)
            {
                this._initialized = true;
                if (this._Str_17931 != null)
                {
                    _local_3 = _local_2.getChildByName(this._Str_17931);
                    if (_local_3 == null)
                    {
                        return;
                    }
                    this._widget.initialize();
                    _local_2.addChildAt(this._widget.container, _local_2.getChildIndex(_local_3));
                    this._widget.container.x = _local_3.x;
                    this._widget.container.y = _local_3.y;
                    _local_2.removeChild(_local_3);
                    _local_3.dispose();
                }
                else
                {
                    if (((!(this._Str_18534 == null)) && (!(this._widget == null))))
                    {
                        this._widget.initialize();
                        this._Str_18534.addChild(this._widget.container);
                    }
                    else
                    {
                        return;
                    }
                }
            }
            if (this._widget.container != null)
            {
                if (((this._widget is ISettingsAwareWidget) && (!(this._commonWidgetSettings == null))))
                {
                    ISettingsAwareWidget(this._widget).settings = this._commonWidgetSettings;
                }
                this._widget.refresh();
            }
        }

        public function get container():IWindow
        {
            return this._widget.container;
        }

        public function _Str_17674():void
        {
            if ((((!(this._widget == null)) && (!(this._widget.container == null))) && (this._widget is _Str_10584)))
            {
                _Str_10584(this._widget)._Str_17674();
            }
        }

        public function disable():void
        {
            if ((((!(this._widget == null)) && (!(this._widget.container == null))) && (this._widget is IDisableAwareWidget)))
            {
                IDisableAwareWidget(this._widget).disable();
            }
        }
    }
}
