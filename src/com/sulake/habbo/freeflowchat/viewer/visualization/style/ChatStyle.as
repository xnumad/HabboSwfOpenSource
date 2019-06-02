package com.sulake.habbo.freeflowchat.viewer.visualization.style
{
    import com.sulake.habbo.freeflowchat.style.IChatStyle;
    import flash.display.BitmapData;
    import flash.geom.Rectangle;
    import flash.text.TextFormat;
    import flash.geom.Point;
    import flash.text.StyleSheet;
    import flash.geom.ColorTransform;
    import flash.display.BlendMode;
    import com.sulake.habbo.freeflowchat.HabboFreeFlowChat;
    import flash.display.Sprite;

    public class ChatStyle implements IChatStyle, IChatStyleInternal 
    {
        private var _background:BitmapData;
        private var _scale9Grid:Rectangle;
        private var _pointer:BitmapData;
        private var _pointerY:int;
        private var _textFieldMargins:Rectangle;
        private var _textFormat:TextFormat;
        private var _iconImage:BitmapData;
        private var _iconOffset:Point;
        private var _selectorPreview:BitmapData;
        private var _color:BitmapData;
        private var _colorOffset:Point;
        private var _overlap:Rectangle;
        private var _isSystemStyle:Boolean;
        private var _isHcOnly:Boolean;
        private var _isAmbassadorOnly:Boolean;
        private var _isStaffOverrideable:Boolean;
        private var _isAnonymous:Boolean;
        private var _allowHTML:Boolean;
        private var _styleSheet:StyleSheet;

        public function ChatStyle(k:BitmapData, _arg_2:Rectangle, _arg_3:BitmapData, _arg_4:int, _arg_5:Rectangle, _arg_6:TextFormat, _arg_7:Boolean, _arg_8:Point, _arg_9:BitmapData, _arg_10:BitmapData, _arg_11:Boolean, _arg_12:Boolean, _arg_13:Boolean, _arg_14:Boolean, _arg_15:BitmapData=null, _arg_16:Point=null, _arg_17:Rectangle=null, _arg_18:Boolean=false, _arg_19:StyleSheet=null)
        {
            this._background = k;
            this._scale9Grid = _arg_2;
            this._pointer = _arg_3;
            this._pointerY = _arg_4;
            this._textFieldMargins = _arg_5;
            this._textFormat = _arg_6;
            this._isAnonymous = _arg_7;
            this._iconOffset = _arg_8;
            this._iconImage = _arg_9;
            this._selectorPreview = _arg_10;
            this._isSystemStyle = _arg_11;
            this._isHcOnly = _arg_12;
            this._isAmbassadorOnly = _arg_14;
            this._isStaffOverrideable = _arg_13;
            this._color = _arg_15;
            this._colorOffset = _arg_16;
            this._overlap = _arg_17;
            this._allowHTML = _arg_18;
            this._styleSheet = _arg_19;
        }

        public function getNewBackgroundSprite(k:uint=0xFFFFFF):Sprite
        {
            var _local_2:BitmapData;
            var _local_3:uint;
            var _local_4:uint;
            var _local_5:uint;
            if (this._color != null)
            {
                _local_2 = new BitmapData(this._background.width, this._background.height, this._background.transparent, 0);
                _local_2.copyPixels(this._background, this._background.rect, new Point(0, 0));
                _local_3 = ((k >> 16) & 0xFF);
                _local_4 = ((k >> 8) & 0xFF);
                _local_5 = ((k >> 0) & 0xFF);
                _local_2.draw(this._color, null, new ColorTransform((_local_3 / 0xFF), (_local_4 / 0xFF), (_local_5 / 0xFF)), BlendMode.DARKEN);
            }
            else
            {
                _local_2 = this._background;
            }
            return HabboFreeFlowChat._Str_18206(this._scale9Grid, _local_2);
        }

        public function get textFormat():TextFormat
        {
            return this._textFormat;
        }

        public function get styleSheet():StyleSheet
        {
            return this._styleSheet;
        }

        public function get pointer():BitmapData
        {
            return this._pointer;
        }

        public function get _Str_8470():int
        {
            return this._background.height - this._pointerY;
        }

        public function get _Str_4931():Boolean
        {
            return this._isAnonymous;
        }

        public function get _Str_5505():Point
        {
            return this._iconOffset;
        }

        public function get _Str_3093():BitmapData
        {
            return this._iconImage;
        }

        public function get textFieldMargins():Rectangle
        {
            return this._textFieldMargins;
        }

        public function get overlap():Rectangle
        {
            return this._overlap;
        }

        public function get selectorPreview():BitmapData
        {
            return this._selectorPreview;
        }

        public function get isSystemStyle():Boolean
        {
            return this._isSystemStyle;
        }

        public function get isHcOnly():Boolean
        {
            return this._isHcOnly;
        }

        public function get isAmbassadorOnly():Boolean
        {
            return this._isAmbassadorOnly;
        }

        public function get isStaffOverrideable():Boolean
        {
            return this._isStaffOverrideable;
        }

        public function get allowHTML():Boolean
        {
            return this._allowHTML;
        }
    }
}
