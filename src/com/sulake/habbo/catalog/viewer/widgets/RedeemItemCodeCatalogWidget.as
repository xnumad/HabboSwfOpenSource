package com.sulake.habbo.catalog.viewer.widgets
{
    import com.sulake.core.window.components.IButtonWindow;
    import com.sulake.core.window.components.ITextFieldWindow;
    import com.sulake.core.window.IWindowContainer;
    import com.sulake.core.window.events.WindowMouseEvent;
    import com.sulake.core.window.events.WindowKeyboardEvent;
    import flash.ui.Keyboard;
    import com.sulake.core.window.events.WindowEvent;
    import com.sulake.core.window.IWindow;
    import com.sulake.habbo.window.utils._Str_2418;

    public class RedeemItemCodeCatalogWidget extends CatalogWidget
    {
        private var _redeemButton:IButtonWindow;
        private var _codeField:ITextFieldWindow;

        public function RedeemItemCodeCatalogWidget(k:IWindowContainer)
        {
            super(k);
        }

        override public function dispose():void
        {
            super.dispose();
            if (this._redeemButton != null)
            {
                this._redeemButton.removeEventListener(WindowMouseEvent.CLICK, this._Str_19160);
                this._redeemButton = null;
            }
            if (this._codeField != null)
            {
                this._codeField.removeEventListener(WindowKeyboardEvent.WINDOW_EVENT_KEY_DOWN, this._Str_10572);
                this._codeField = null;
            }
        }

        override public function init():Boolean
        {
            if (!super.init())
            {
                return false;
            }
            this._redeemButton = (_window.findChildByName("redeem") as IButtonWindow);
            if (this._redeemButton != null)
            {
                this._redeemButton.addEventListener(WindowMouseEvent.CLICK, this._Str_19160);
            }
            this._codeField = (_window.findChildByName("voucher_code") as ITextFieldWindow);
            if (this._codeField != null)
            {
                this._codeField.addEventListener(WindowKeyboardEvent.WINDOW_EVENT_KEY_DOWN, this._Str_10572);
            }
            return true;
        }

        private function _Str_19160(k:WindowMouseEvent):void
        {
            this.redeem();
        }

        private function _Str_10572(k:WindowEvent=null, _arg_2:IWindow=null):void
        {
            var _local_3:WindowKeyboardEvent = (k as WindowKeyboardEvent);
            if (_local_3.charCode == Keyboard.ENTER)
            {
                this.redeem();
            }
        }

        private function redeem():void
        {
            var voucher:String;
            var input:IWindow = _window.findChildByName("voucher_code");
            if (input != null)
            {
                voucher = input.caption;
                if (voucher.length > 0)
                {
                    page.viewer.catalog.redeemVoucher(voucher);
                    input.caption = "";
                }
                else
                {
                    page.viewer.catalog.windowManager.alert("${catalog.voucher.empty.title}", "${catalog.voucher.empty.desc}", 0, function (k:_Str_2418, _arg_2:WindowEvent):void
                    {
                        k.dispose();
                    });
                }
            }
        }
    }
}
