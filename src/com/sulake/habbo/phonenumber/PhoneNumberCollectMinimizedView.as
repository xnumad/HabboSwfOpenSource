package com.sulake.habbo.phonenumber
{
    import com.sulake.core.window.IWindow;
    import com.sulake.core.window.events.WindowMouseEvent;
    import com.sulake.core.window.components.IRegionWindow;

    public class PhoneNumberCollectMinimizedView 
    {
        private static const _Str_3591:uint = 4286084205;
        private static const _Str_3385:uint = 4283781966;

        private var _component:HabboPhoneNumber;
        private var _window:IWindow;

        public function PhoneNumberCollectMinimizedView(k:HabboPhoneNumber)
        {
            this._component = k;
            this.createWindow();
        }

        public function dispose():void
        {
            if (this._window)
            {
                this._window.removeEventListener(WindowMouseEvent.CLICK, this._Str_11324);
                this._window.dispose();
                this._window = null;
            }
            this._component = null;
        }

        public function get window():IWindow
        {
            return this._window;
        }

        private function createWindow():void
        {
            if (this._window)
            {
                return;
            }
            this._window = this._component.windowManager.buildFromXML(XML(this._component.assets.getAssetByName("phonenumber_collect_minimized_xml").content));
            this._window.addEventListener(WindowMouseEvent.CLICK, this._Str_11324);
            this._window.addEventListener(WindowMouseEvent.OVER, this._Str_7963);
            this._window.addEventListener(WindowMouseEvent.OUT, this._Str_7021);
            IRegionWindow(this._window).findChildByTag("BGCOLOR").color = _Str_3385;
        }

        private function _Str_11324(k:WindowMouseEvent):void
        {
            this._component._Str_17799(false);
        }

        private function _Str_7963(k:WindowMouseEvent):void
        {
            IRegionWindow(this._window).findChildByTag("BGCOLOR").color = _Str_3591;
        }

        private function _Str_7021(k:WindowMouseEvent):void
        {
            IRegionWindow(this._window).findChildByTag("BGCOLOR").color = _Str_3385;
        }
    }
}

