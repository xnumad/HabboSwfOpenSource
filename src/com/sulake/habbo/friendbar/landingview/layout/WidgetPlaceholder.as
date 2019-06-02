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
        private var _Str_2268:ILandingViewWidget;
        private var _Str_17931:String;
        private var _Str_18534:IWindowContainer;
        private var _initialized:Boolean;
        private var _Str_3157:_Str_3198;

        public function WidgetPlaceholder(k:ILandingViewWidget, _arg_2:String, _arg_3:_Str_3198, _arg_4:IWindowContainer=null)
        {
            this._Str_2268 = k;
            this._Str_17931 = _arg_2;
            this._Str_3157 = _arg_3;
            this._Str_18534 = _arg_4;
        }

        public function dispose():void
        {
            if (this._Str_2268)
            {
                this._Str_2268.dispose();
                this._Str_2268 = null;
            }
            if (this._Str_3157)
            {
                this._Str_3157 = null;
            }
        }

        public function get disposed():Boolean
        {
            return (this._Str_2268 == null) && (this._Str_3157 == null);
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
                    this._Str_2268.initialize();
                    _local_2.addChildAt(this._Str_2268.container, _local_2.getChildIndex(_local_3));
                    this._Str_2268.container.x = _local_3.x;
                    this._Str_2268.container.y = _local_3.y;
                    _local_2.removeChild(_local_3);
                    _local_3.dispose();
                }
                else
                {
                    if (((!(this._Str_18534 == null)) && (!(this._Str_2268 == null))))
                    {
                        this._Str_2268.initialize();
                        this._Str_18534.addChild(this._Str_2268.container);
                    }
                    else
                    {
                        return;
                    }
                }
            }
            if (this._Str_2268.container != null)
            {
                if (((this._Str_2268 is ISettingsAwareWidget) && (!(this._Str_3157 == null))))
                {
                    ISettingsAwareWidget(this._Str_2268).settings = this._Str_3157;
                }
                this._Str_2268.refresh();
            }
        }

        public function get container():IWindow
        {
            return this._Str_2268.container;
        }

        public function _Str_17674():void
        {
            if ((((!(this._Str_2268 == null)) && (!(this._Str_2268.container == null))) && (this._Str_2268 is _Str_10584)))
            {
                _Str_10584(this._Str_2268)._Str_17674();
            }
        }

        public function disable():void
        {
            if ((((!(this._Str_2268 == null)) && (!(this._Str_2268.container == null))) && (this._Str_2268 is IDisableAwareWidget)))
            {
                IDisableAwareWidget(this._Str_2268).disable();
            }
        }
    }
}
