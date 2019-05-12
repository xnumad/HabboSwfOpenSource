package com.sulake.habbo.friendbar.view.utils
{
    import com.sulake.core.runtime.IDisposable;
    import flash.text.TextField;
    import flash.text.TextFormat;
    import flash.text.TextFieldAutoSize;
    import com.sulake.core.window.components.ITextWindow;

    public class TextCropper implements IDisposable 
    {
        private var _disposed:Boolean = false;
        private var _textField:TextField;
        private var _textFormat:TextFormat;
        private var _tailText:String = "...";
        private var _tailSize:int = 20;

        public function TextCropper()
        {
            this._textField = new TextField();
            this._textField.autoSize = TextFieldAutoSize.LEFT;
            this._textFormat = this._textField.defaultTextFormat;
        }

        public function get disposed():Boolean
        {
            return this._disposed;
        }

        public function dispose():void
        {
            if (!this._disposed)
            {
                this._textField = null;
                this._disposed = true;
            }
        }

        public function crop(k:ITextWindow):void
        {
            var _local_3:int;
            this._textFormat.font = k.fontFace;
            this._textFormat.size = k.fontSize;
            this._textFormat.bold = k.bold;
            this._textFormat.italic = k.italic;
            this._textField.setTextFormat(this._textFormat);
            this._textField.text = k.getLineText(0);
            var _local_2:int = this._textField.textWidth;
            if (_local_2 > k.width)
            {
                _local_3 = this._textField.getCharIndexAtPoint((k.width - this._tailSize), (this._textField.textHeight / 2));
                k.text = (k.text.slice(0, _local_3) + this._tailText);
            }
        }
    }
}
