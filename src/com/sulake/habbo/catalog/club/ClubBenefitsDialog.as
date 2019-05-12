package com.sulake.habbo.catalog.club
{
    import com.sulake.core.runtime.IDisposable;
    import com.sulake.core.window.IWindowContainer;
    import com.sulake.core.window.events.WindowMouseEvent;
    import com.sulake.habbo.catalog.HabboCatalog;

    public class ClubBenefitsDialog implements IDisposable 
    {
        private var _disposed:Boolean = false;
        private var _benefitsWindow:IWindowContainer;

        public function ClubBenefitsDialog(k:HabboCatalog)
        {
            this._benefitsWindow = (k.utils.createWindow("vip_benefits") as IWindowContainer);
            this._benefitsWindow.findChildByName("header_button_close").addEventListener(WindowMouseEvent.CLICK, this.onCloseHandler);
            this._benefitsWindow.center();
        }

        public function dispose():void
        {
            if (!this._disposed)
            {
                if (this._benefitsWindow != null)
                {
                    this._benefitsWindow.dispose();
                    this._benefitsWindow = null;
                }
            }
            this._disposed = true;
        }

        public function get disposed():Boolean
        {
            return this._disposed;
        }

        private function onCloseHandler(k:WindowMouseEvent):void
        {
            this.dispose();
        }
    }
}
