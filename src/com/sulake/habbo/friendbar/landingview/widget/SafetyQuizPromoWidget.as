package com.sulake.habbo.friendbar.landingview.widget
{
    import com.sulake.habbo.friendbar.landingview.interfaces.ILandingViewWidget;
    import com.sulake.habbo.friendbar.landingview.HabboLandingView;
    import com.sulake.core.window.IWindowContainer;
    import com.sulake.core.window.events.WindowMouseEvent;
    import com.sulake.core.window.events.WindowEvent;
    import com.sulake.core.window.IWindow;
    import com.sulake.habbo.window.widgets._Str_2483;
    import com.sulake.core.window.components.IWidgetWindow;

    public class SafetyQuizPromoWidget implements ILandingViewWidget 
    {
        private var _landingView:HabboLandingView;
        private var _container:IWindowContainer;
        private var _disposed:Boolean;

        public function SafetyQuizPromoWidget(k:HabboLandingView)
        {
            this._landingView = k;
        }

        public function initialize():void
        {
            this._container = IWindowContainer(this._landingView.getXmlWindow("safety_quiz_promo"));
            this._container.procedure = this._Str_16893;
            this.refresh();
        }

        private function _Str_16893(k:WindowEvent, _arg_2:IWindow):void
        {
            if (((k.type == WindowMouseEvent.CLICK) && (_arg_2.name == "safety_quiz_button")))
            {
                this._landingView._Str_2602._Str_8723();
            }
        }

        public function refresh():void
        {
            if (((!(this._container == null)) && (!(this._container.disposed))))
            {
                _Str_2483(IWidgetWindow(this._container.findChildByName("avatar")).widget).figure = this._landingView.sessionDataManager.figure;
            }
        }

        public function get container():IWindow
        {
            return this._container;
        }

        public function dispose():void
        {
            if (!this._disposed)
            {
                if (this._container != null)
                {
                    this._container.dispose();
                    this._container = null;
                }
                this._landingView = null;
                this._disposed = true;
            }
        }

        public function get disposed():Boolean
        {
            return this._disposed;
        }
    }
}


