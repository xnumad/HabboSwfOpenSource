package com.sulake.habbo.inventory.badges
{
    import com.sulake.core.window.IWindowContainer;
    import com.sulake.core.window.IWindow;
    import com.sulake.habbo.window.widgets._Str_2402;
    import com.sulake.core.window.components.IWidgetWindow;

    public class Badge 
    {
        private static const _Str_4072:int = 0xCCCCCC;
        private static const _Str_4169:int = 10275685;

        private var _badgeId:String;
        private var _isInUse:Boolean;
        private var _isSelected:Boolean;
        private var _window:IWindowContainer;
        private var _selectionHighlighter:IWindow;
        private var _isUnseen:Boolean;

        public function Badge(badgeId:String, window:IWindowContainer, isUnseen:Boolean)
        {
            this._badgeId = badgeId;
            this._window = window;
            this._selectionHighlighter = this._window.findChildByTag("BG_COLOR");
            this._isUnseen = isUnseen;
            _Str_2402(IWidgetWindow(this._window.findChildByName("badge")).widget).badgeId = badgeId;
            this._window.findChildByName("badge").visible = true;
            this._Str_2365 = false;
        }

        public function get badgeId():String
        {
            return this._badgeId;
        }

        public function get _Str_3222():Boolean
        {
            return this._isInUse;
        }

        public function get _Str_2365():Boolean
        {
            return this._isSelected;
        }

        public function get window():IWindowContainer
        {
            return this._window;
        }

        public function set _Str_3222(k:Boolean):void
        {
            this._isInUse = k;
        }

        public function set _Str_2365(k:Boolean):void
        {
            this._isSelected = k;
            if (this._selectionHighlighter == null)
            {
                return;
            }
            this._selectionHighlighter.color = ((this._isUnseen) ? _Str_4169 : _Str_4072);
            this._window.findChildByName("outline").visible = k;
        }

        public function set _Str_3613(k:Boolean):void
        {
            if (this._isUnseen != k)
            {
                this._isUnseen = k;
                this._Str_2365 = this._isSelected;
            }
        }
    }
}

