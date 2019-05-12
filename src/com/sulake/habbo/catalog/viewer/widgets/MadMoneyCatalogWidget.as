package com.sulake.habbo.catalog.viewer.widgets
{
    import com.sulake.core.window.components.IButtonWindow;
    import com.sulake.core.window.IWindowContainer;
    import com.sulake.core.window.events.WindowMouseEvent;
    import com.sulake.habbo.window.utils._Str_2418;
    import com.sulake.core.window.events.WindowEvent;

    public class MadMoneyCatalogWidget extends CatalogWidget
    {
        private var _buyButton:IButtonWindow;

        public function MadMoneyCatalogWidget(k:IWindowContainer)
        {
            super(k);
        }

        override public function dispose():void
        {
            super.dispose();
            if (this._buyButton != null)
            {
                this._buyButton.removeEventListener(WindowMouseEvent.CLICK, this._Str_5162);
                this._buyButton = null;
            }
        }

        override public function init():Boolean
        {
            if (!super.init())
            {
                return false;
            }
            this._buyButton = (_window.findChildByName("ctlg_madmoney_button") as IButtonWindow);
            if (this._buyButton != null)
            {
            }
            return true;
        }

        private function _Str_5162(event:WindowMouseEvent):void
        {
            page.viewer.catalog.windowManager.alert("TODO", "Fix in MadMoneyCatalogWidget.as", 0, function (k:_Str_2418, _arg_2:WindowEvent):void
            {
                k.dispose();
            });
        }
    }
}
