package com.sulake.habbo.navigator
{
    import com.sulake.core.window.components.ITextWindow;

    public class CutToHeight implements BinarySearchTest 
    {
        private var _value:String;
        private var _text:ITextWindow;
        private var _maxHeight:int;


        public function test(k:int):Boolean
        {
            this._text.text = (this._value.substring(0, k) + "...");
            return this._text.textHeight > this._maxHeight;
        }

        public function _Str_20578(k:String, _arg_2:ITextWindow, _arg_3:int):void
        {
            this._value = k;
            this._text = _arg_2;
            this._maxHeight = _arg_3;
        }
    }
}
