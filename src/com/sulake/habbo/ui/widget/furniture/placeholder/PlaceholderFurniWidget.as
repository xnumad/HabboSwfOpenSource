package com.sulake.habbo.ui.widget.furniture.placeholder
{
    import com.sulake.habbo.ui.widget.ConversionTrackingWidget;
    import com.sulake.habbo.ui.IRoomWidgetHandler;
    import com.sulake.habbo.window.IHabboWindowManager;
    import com.sulake.core.assets.IAssetLibrary;
    import com.sulake.habbo.localization.IHabboLocalizationManager;
    import com.sulake.habbo.ui.widget.events._Str_4984;
    import flash.events.IEventDispatcher;

    public class PlaceholderFurniWidget extends ConversionTrackingWidget 
    {
        private var _Str_2271:PlaceholderView;

        public function PlaceholderFurniWidget(k:IRoomWidgetHandler, _arg_2:IHabboWindowManager, _arg_3:IAssetLibrary=null, _arg_4:IHabboLocalizationManager=null)
        {
            super(k, _arg_2, _arg_3, _arg_4);
        }

        override public function dispose():void
        {
            if (this._Str_2271 != null)
            {
                this._Str_2271.dispose();
                this._Str_2271 = null;
            }
            super.dispose();
        }

        override public function registerUpdateEvents(k:IEventDispatcher):void
        {
            if (k == null)
            {
                return;
            }
            k.addEventListener(_Str_4984.RWSPE_SHOW_PLACEHOLDER, this._Str_10637);
            super.registerUpdateEvents(k);
        }

        override public function unregisterUpdateEvents(k:IEventDispatcher):void
        {
            if (k == null)
            {
                return;
            }
            k.removeEventListener(_Str_4984.RWSPE_SHOW_PLACEHOLDER, this._Str_10637);
        }

        private function _Str_10637(k:_Str_4984):void
        {
            this._Str_3030();
        }

        private function _Str_3030():void
        {
            if (this._Str_2271 == null)
            {
                this._Str_2271 = new PlaceholderView(assets, windowManager);
            }
            this._Str_2271._Str_3360();
        }

        private function _Str_2718():void
        {
            if (this._Str_2271 != null)
            {
                this._Str_2271.dispose();
                this._Str_2271 = null;
            }
        }
    }
}
