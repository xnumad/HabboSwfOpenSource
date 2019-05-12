package org.openvideoads.util
{
    import org.openvideoads.base.Debuggable;
    import flash.text.TextField;
    import flash.text.TextFormat;
    import flash.display.BlendMode;
    import flash.text.AntiAliasType;
    import flash.system.Capabilities;
    import flash.text.Font;
    import flash.geom.Matrix;
    import flash.display.GradientType;
    import flash.display.Graphics;
    import flash.display.Shape;
    import flash.display.DisplayObjectContainer;
    import flash.display.DisplayObject;

    public class GraphicsUtils extends Debuggable 
    {


        public static function _Str_20156(k:Boolean, _arg_2:String=null, _arg_3:int=12, _arg_4:Boolean=false, _arg_5:uint=0xFFFFFF):TextField
        {
            var _local_8:Array;
            var _local_9:Array;
            var _local_10:Number;
            var _local_11:Number;
            var _local_6:TextField = new TextField();
            var _local_7:TextFormat = new TextFormat();
            _local_6.blendMode = BlendMode.LAYER;
            if (_arg_2 != null)
            {
                _local_7.font = _arg_2;
                _local_6.antiAliasType = AntiAliasType.ADVANCED;
            }
            else
            {
                if (Capabilities.os.indexOf("Windows") == 0)
                {
                    _local_8 = ["Lucida Grande", "Lucida Sans Unicode", "Bitstream Vera", "Verdana", "Arial", "_sans", "_serif"];
                    _local_9 = Font.enumerateFonts(true);
                    _local_7.font = "_sans";
                    _local_10 = 0;
                    while (_local_10 < _local_8.length)
                    {
                        _local_11 = 0;
                        while (_local_11 < _local_9.length)
                        {
                            if (Font(_local_9[_local_11]).fontName == _local_8[_local_10])
                            {
                                _local_7.font = _local_8[_local_10];
                                _local_11 = _local_9.length;
                                _local_10 = _local_8.length;
                            }
                            _local_11++;
                        }
                        _local_10++;
                    }
                }
                else
                {
                    _local_7.font = "Lucida Grande, Lucida Sans Unicode, Bitstream Vera, Verdana, Arial, _sans, _serif";
                    _local_6.antiAliasType = AntiAliasType.ADVANCED;
                }
            }
            _local_7.size = _arg_3;
            _local_7.color = _arg_5;
            _local_7.bold = _arg_4;
            _local_6.embedFonts = k;
            _local_6.defaultTextFormat = _local_7;
            return _local_6;
        }

        public static function beginGradientFill(k:Graphics, _arg_2:Number, _arg_3:Number, _arg_4:Number, _arg_5:Number, _arg_6:Number=1):void
        {
            var _local_7:Array = [_arg_4, _arg_5, _arg_4];
            var _local_8:Matrix = new Matrix();
            _local_8.createGradientBox(_arg_2, _arg_3, (Math.PI / 2));
            k.beginGradientFill(GradientType.LINEAR, _local_7, [_arg_6, _arg_6, _arg_6], [0, 128, 0xFF], _local_8);
        }

        public static function _Str_22018(k:Graphics, _arg_2:Number, _arg_3:Number, _arg_4:Array, _arg_5:Array):void
        {
            var _local_6:Matrix = new Matrix();
            _local_6.createGradientBox(_arg_2, _arg_3, (Math.PI / 2));
            var _local_7:Array = new Array();
            var _local_8:int = (0xFF / (_arg_4.length - 1));
            var _local_9:Number = 0;
            while (_local_9 < _arg_4.length)
            {
                _local_7.push((_local_9 * _local_8));
                _local_9++;
            }
            k.beginGradientFill(GradientType.LINEAR, _arg_4, _arg_5, _local_7, _local_6);
        }

        public static function drawRoundRectangle(k:Graphics, _arg_2:Number, _arg_3:Number, _arg_4:Number, _arg_5:Number, _arg_6:Number):void
        {
            if (_arg_6 > 0)
            {
                k.drawRoundRect(_arg_2, _arg_3, _arg_4, _arg_5, _arg_6, _arg_6);
            }
            else
            {
                k.drawRect(_arg_2, _arg_3, _arg_4, _arg_5);
            }
        }

        public static function _Str_23331(k:DisplayObjectContainer, _arg_2:int, _arg_3:Array, _arg_4:Number, _arg_5:Number=0, _arg_6:Number=0):void
        {
            _Str_17793(k);
            var _local_7:Shape = new Shape();
            _local_7.name = "_gradient";
            k.addChildAt(_local_7, _arg_2);
            _local_7.graphics.clear();
            beginFill(_local_7.graphics, _arg_3, k.width, k.height);
            GraphicsUtils.drawRoundRectangle(_local_7.graphics, _arg_5, _arg_6, k.width, k.height, _arg_4);
            _local_7.graphics.endFill();
        }

        public static function _Str_17793(k:DisplayObjectContainer):void
        {
            var _local_2:DisplayObject = k.getChildByName("_gradient");
            if (_local_2)
            {
                k.removeChild(_local_2);
            }
        }

        private static function beginFill(k:Graphics, _arg_2:Array, _arg_3:Number, _arg_4:Number):void
        {
            var _local_5:Array = new Array();
            var _local_6:Number = 0;
            while (_local_6 < _arg_2.length)
            {
                _local_5.push(0xFFFFFF);
                _local_6++;
            }
            _Str_22018(k, _arg_3, _arg_4, _local_5, _arg_2);
        }

        public static function _Str_23784(k:String):uint
        {
            var _local_2:RegExp = new RegExp(/#/g);
            return uint(String(k).replace(_local_2, "0x"));
        }
    }
}
