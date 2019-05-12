package com.sulake.habbo.catalog.viewer.widgets
{
    import com.sulake.core.window.components.ITextFieldWindow;
    import com.sulake.core.window.IWindowContainer;
    import com.sulake.core.window.events.WindowKeyboardEvent;
    import com.sulake.habbo.catalog.viewer.widgets.events.TextInputEvent;

    public class TextInputCatalogWidget extends CatalogWidget
    {
        private var _inputText:ITextFieldWindow;

        public function TextInputCatalogWidget(k:IWindowContainer)
        {
            super(k);
        }

        override public function init():Boolean
        {
            if (!super.init())
            {
                return false;
            }
            this._inputText = (_window.findChildByName("input_text") as ITextFieldWindow);
            if (this._inputText != null)
            {
                this._inputText.addEventListener(WindowKeyboardEvent.WINDOW_EVENT_KEY_UP, this._Str_23857);
            }
            return true;
        }

        private function _Str_23857(k:WindowKeyboardEvent):void
        {
            if (this._inputText == null)
            {
                return;
            }
            events.dispatchEvent(new TextInputEvent(this._inputText.text));
        }
    }
}
