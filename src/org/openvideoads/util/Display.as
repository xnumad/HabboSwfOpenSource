package org.openvideoads.util
{
    import org.openvideoads.base.Debuggable;
    import flash.display.DisplayObjectContainer;

    public class Display extends Debuggable 
    {
        public static const NORMAL:String = "normal";
        public static const FULLSCREEN:String = "fullscreen";
        public static const THUMBNAIL:String = "thumbnail";

        protected var _displayObjectContainer:DisplayObjectContainer;
        protected var _displayWidth:Number = 0;
        protected var _displayHeight:Number = 0;
        protected var _displayMode:String = "normal";
        protected var _displaySpecification:DisplaySpecification = null;
        protected var _Str_16523:Boolean = true;
        protected var _Str_18638:Number = 0;
        protected var _Str_17522:Number = 0;

        public function Display(k:DisplayObjectContainer, _arg_2:int, _arg_3:int, _arg_4:String, _arg_5:DisplaySpecification, _arg_6:Boolean, _arg_7:Number, _arg_8:Number)
        {
            this._displayObjectContainer = k;
            this._displayWidth = _arg_2;
            this._displayHeight = _arg_3;
            this._displayMode = _arg_4;
            this._displaySpecification = _arg_5;
            this._Str_16523 = _arg_6;
            this._Str_18638 = _arg_7;
            this._Str_17522 = _arg_8;
        }

        public function set displayWidth(k:Number):void
        {
            this._displayWidth = k;
        }

        public function get displayWidth():Number
        {
            return this._displayWidth;
        }

        public function set displayHeight(k:Number):void
        {
            this._displayHeight = k;
        }

        public function get displayHeight():Number
        {
            return this._displayHeight;
        }

        public function get _Str_25114():Number
        {
            return this._displaySpecification.width;
        }

        public function get _Str_25629():Number
        {
            return this._displaySpecification.height;
        }

        public function set displayMode(k:String):void
        {
            this._displayMode = k;
        }

        public function get displayMode():String
        {
            return this._displayMode;
        }

        public function isNormalMode():Boolean
        {
            if (this._displayMode != null)
            {
                return StringUtils._Str_2576(this._displayMode, Display.NORMAL);
            }
            return false;
        }

        public function _Str_22879():Boolean
        {
            if (this._displayMode != null)
            {
                return this.isNormalMode() == false;
            }
            return false;
        }

        public function get scaleX():Number
        {
            return this.displayWidth / this._Str_25114;
        }

        public function get scaleY():Number
        {
            return this.displayHeight / this._Str_25629;
        }

        public function get _Str_21708():Boolean
        {
            return this._Str_16523;
        }

        public function get _Str_25295():Number
        {
            return this._Str_18638;
        }

        public function get _Str_22782():Number
        {
            return this._Str_17522;
        }

        public function getActiveMargin(k:Boolean=false):Number
        {
            if (this._Str_21708)
            {
                return this._displaySpecification.marginsSpecification.getWithControlsMargin(this.displayMode, k);
            }
            return this._displaySpecification.marginsSpecification.getWithoutControlsMargin(this.displayMode, k);
        }

        public function getMarginAdjustedHeight(k:Boolean=false):Number
        {
            return this.displayHeight - this.getActiveMargin(k);
        }

        public function set displayObjectContainer(k:DisplayObjectContainer):void
        {
            this._displayObjectContainer = k;
        }

        public function get displayObjectContainer():DisplayObjectContainer
        {
            return this._displayObjectContainer;
        }

        public function clone():Display
        {
            return new Display(this._displayObjectContainer, this._displayWidth, this._displayHeight, this._displayMode, this._displaySpecification, this._Str_16523, this._Str_18638, this._Str_17522);
        }

        public function toString():String
        {
            return ((((("(displayWidth: " + this._displayWidth) + ", displayHeight: ") + this._displayHeight) + ", displayMode: ") + this._displayMode) + ")";
        }
    }
}
