package com.sulake.habbo.ui.widget.camera
{
    import com.sulake.core.utils.Map;
    import com.sulake.habbo.localization.IHabboLocalizationManager;
    import com.sulake.core.window.IWindowContainer;
    import org.openvideoads.util.StringUtils;
    import flash.display.BlendMode;
    import flash.filters.ColorMatrixFilter;
    import flash.filters.BitmapFilter;
    import com.sulake.core.window.components.IRegionWindow;
    import com.sulake.core.window.IWindow;

    public class CameraEffect 
    {
        private static const _Str_18076:Number = 0.5;
        public static const COLORMATRIX:String = "colormatrix";
        public static const COMPOSITE:String = "composite";
        public static const FRAME:String = "frame";
        private static var _Str_3005:Map;
        private static var _Str_15813:Array = [];
        private static var _Str_2856:int = 1;
        private static var _Str_2499:IHabboLocalizationManager;

        public var type:String;
        public var _Str_12742:Array;
        public var _Str_16566:String;
        public var name:String;
        public var description:String;
        public var value:int;
        public var _Str_5966:Boolean = false;
        public var _Str_15852:int = 0;
        public var button:IWindowContainer;

        public function CameraEffect(k:String, _arg_2:String, _arg_3:Array, _arg_4:String, _arg_5:int)
        {
            this.name = k;
            this.description = _Str_2499.getLocalization(("camera.effect.name." + k), k);
            this.type = _arg_2;
            this._Str_16566 = _arg_4;
            this._Str_12742 = _arg_3;
            this._Str_15852 = _arg_5;
        }

        public static function _Str_21096():void
        {
            var k:CameraEffect;
            for each (k in _Str_3005)
            {
                k.value = (_Str_18076 * _Str_2856);
                k._Str_15771(false);
            }
        }

        public static function _Str_24241(k:int):void
        {
            _Str_2856 = k;
        }

        public static function _Str_6532(k:String, _arg_2:IHabboLocalizationManager):Map
        {
            var _local_3:Array;
            var _local_4:String;
            if (!_Str_3005)
            {
                if (k != null)
                {
                    _local_3 = k.split(",");
                    for each (_local_4 in _local_3)
                    {
                        _Str_15813.push(StringUtils.trim(_local_4));
                    }
                }
                _Str_2499 = _arg_2;
                _Str_21194();
            }
            return _Str_3005;
        }

        private static function _Str_21194():void
        {
            _Str_3005 = new Map();
            _Str_2428("dark_sepia", COLORMATRIX, [0.4, 0.4, 0.1, 0, 110, 0.3, 0.4, 0.1, 0, 30, 0.3, 0.2, 0.1, 0, 0, 0, 0, 0, 1, 0], null);
            _Str_2428("increase_saturation", COLORMATRIX, [2, -0.5, -0.5, 0, 0, -0.5, 2, -0.5, 0, 0, -0.5, -0.5, 2, 0, 0, 0, 0, 0, 1, 0], null);
            _Str_2428("increase_contrast", COLORMATRIX, [1.5, 0, 0, 0, -50, 0, 1.5, 0, 0, -50, 0, 0, 1.5, 0, -50, 0, 0, 0, 1.5, 0], null);
            _Str_2428("shadow_multiply_02", COMPOSITE, null, BlendMode.MULTIPLY);
            _Str_2428("color_1", COLORMATRIX, [0.393, 0.769, 0.189, 0, 0, 0.349, 0.686, 0.168, 0, 0, 0.272, 0.534, 0.131, 0, 0, 0, 0, 0, 1, 0], null, 1);
            _Str_2428("hue_bright_sat", COLORMATRIX, [1, 0.6, 0.2, 0, -50, 0.2, 1, 0.6, 0, -50, 0.6, 0.2, 1, 0, -50, 0, 0, 0, 1, 0], null, 1);
            _Str_2428("hearts_hardlight_02", COMPOSITE, null, BlendMode.HARDLIGHT, 1);
            _Str_2428("texture_overlay", COMPOSITE, null, BlendMode.OVERLAY, 1);
            _Str_2428("pinky_nrm", COMPOSITE, null, BlendMode.NORMAL, 1);
            _Str_2428("color_2", COLORMATRIX, [0.333, 0.333, 0.333, 0, 0, 0.333, 0.333, 0.333, 0, 0, 0.333, 0.333, 0.333, 0, 0, 0, 0, 0, 1, 0], null, 2);
            _Str_2428("night_vision", COLORMATRIX, [0, 0, 0, 0, 0, 0, 1.1, 0, 0, -50, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0], null, 2);
            _Str_2428("stars_hardlight_02", COMPOSITE, null, BlendMode.HARDLIGHT, 2);
            _Str_2428("coffee_mpl", COMPOSITE, null, BlendMode.MULTIPLY, 2);
            _Str_2428("security_hardlight", COMPOSITE, null, BlendMode.HARDLIGHT, 3);
            _Str_2428("bluemood_mpl", COMPOSITE, null, BlendMode.MULTIPLY, 3);
            _Str_2428("rusty_mpl", COMPOSITE, null, BlendMode.MULTIPLY, 3);
            _Str_2428("decr_conrast", COLORMATRIX, [0.5, 0, 0, 0, 50, 0, 0.5, 0, 0, 50, 0, 0, 0.5, 0, 50, 0, 0, 0, 1, 0], null, 4);
            _Str_2428("green_2", COLORMATRIX, [0.5, 0.5, 0.5, 0, 0, 0.5, 0.5, 0.5, 0, 90, 0.5, 0.5, 0.5, 0, 0, 0, 0, 0, 1, 0], null, 4);
            _Str_2428("alien_hrd", COMPOSITE, null, BlendMode.HARDLIGHT, 4);
            _Str_2428("color_3", COLORMATRIX, [0.609, 0.609, 0.082, 0, 0, 0.309, 0.609, 0.082, 0, 0, 0.309, 0.609, 0.082, 0, 0, 0, 0, 0, 1, 0], null, 5);
            _Str_2428("color_4", COLORMATRIX, [0.8, -0.8, 1, 0, 70, 0.8, -0.8, 1, 0, 70, 0.8, -0.8, 1, 0, 70, 0, 0, 0, 1, 0], null, 5);
            _Str_2428("toxic_hrd", COMPOSITE, null, BlendMode.HARDLIGHT, 5);
            _Str_2428("hypersaturated", COLORMATRIX, [2, -1, 0, 0, 0, -1, 2, 0, 0, 0, 0, -1, 2, 0, 0, 0, 0, 0, 1, 0], null, 6);
            _Str_2428("Yellow", COLORMATRIX, [1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0], null, 6);
            _Str_2428("misty_hrd", COMPOSITE, null, BlendMode.HARDLIGHT, 6);
            _Str_2428("x_ray", COLORMATRIX, [0, 1.2, 0, 0, -100, 0, 2, 0, 0, -120, 0, 2, 0, 0, -120, 0, 0, 0, 1, 0], null, 7);
            _Str_2428("decrease_saturation", COLORMATRIX, [0.7, 0.2, 0.2, 0, 0, 0.2, 0.7, 0.2, 0, 0, 0.2, 0.2, 0.7, 0, 0, 0, 0, 0, 1, 0], null, 7);
            _Str_2428("drops_mpl", COMPOSITE, null, BlendMode.MULTIPLY, 8);
            _Str_2428("shiny_hrd", COMPOSITE, null, BlendMode.HARDLIGHT, 9);
            _Str_2428("glitter_hrd", COMPOSITE, null, BlendMode.HARDLIGHT, 10);
            _Str_2428("frame_gold", FRAME, null, null, 999);
            _Str_2428("frame_gray_4", FRAME, null, null, 999);
            _Str_2428("frame_black_2", FRAME, null, null, 999);
            _Str_2428("frame_wood_2", FRAME, null, null, 999);
            _Str_2428("finger_nrm", FRAME, null, null, 999);
            _Str_2428("color_5", COLORMATRIX, [3.309, 0.609, 1.082, 0.2, 0, 0.309, 0.609, 0.082, 0, 0, 1.309, 0.609, 0.082, 0, 0, 0, 0, 0, 1, 0], null, 999);
            _Str_2428("black_white_negative", COLORMATRIX, [-0.5, -0.5, -0.5, 0, 0xFF, -0.5, -0.5, -0.5, 0, 0xFF, -0.5, -0.5, -0.5, 0, 0xFF, 0, 0, 0, 1, 0], null, 999);
            _Str_2428("blue", COLORMATRIX, [0.5, 0.5, 0.5, 0, -255, 0.5, 0.5, 0.5, 0, -170, 0.5, 0.5, 0.5, 0, 0, 0, 0, 0, 1, 0], null, 999);
            _Str_2428("red", COLORMATRIX, [0.5, 0.5, 0.5, 0, 0, 0.5, 0.5, 0.5, 0, -170, 0.5, 0.5, 0.5, 0, -170, 0, 0, 0, 1, 0], null, 999);
            _Str_2428("green", COLORMATRIX, [0.5, 0.5, 0.5, 0, -170, 0.5, 0.5, 0.5, 0, 0, 0.5, 0.5, 0.5, 0, -170, 0, 0, 0, 1, 0], null, 999);
        }

        private static function _Str_2428(k:String, _arg_2:String, _arg_3:Array, _arg_4:String, _arg_5:int=0):void
        {
            if (_Str_15813.indexOf(k) >= 0)
            {
                _Str_3005[k] = new CameraEffect(k, _arg_2, _arg_3, _arg_4, _arg_5);
            }
        }


        public function _Str_10615():Number
        {
            return this.value / _Str_2856;
        }

        public function _Str_20730():Boolean
        {
            return this.type == FRAME;
        }

        public function _Str_25234():Boolean
        {
            return !(this.type == FRAME);
        }

        public function _Str_20652(k:Boolean=false):BitmapFilter
        {
            if (k)
            {
                return new ColorMatrixFilter(this._Str_12742);
            }
            var _local_2:Array = [];
            var _local_3:Array = [1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 1, 0];
            var _local_4:int;
            while (_local_4 < this._Str_12742.length)
            {
                _local_2.push(((this._Str_12742[_local_4] * this._Str_10615()) + (_local_3[_local_4] * (1 - this._Str_10615()))));
                _local_4++;
            }
            var _local_5:ColorMatrixFilter = new ColorMatrixFilter(_local_2);
            return _local_5;
        }

        public function _Str_15771(k:Boolean):void
        {
            var _local_2:IRegionWindow;
            var _local_3:IWindow;
            this._Str_5966 = k;
            if (this.button)
            {
                this._Str_19368(this._Str_5966);
                _local_2 = (this.button.findChildByName("remove_effect_button") as IRegionWindow);
                _local_2.visible = this._Str_5966;
                if (!this._Str_20730())
                {
                    _local_3 = (this.button.findChildByName("active_indicator") as IWindow);
                    _local_3.visible = this._Str_5966;
                }
            }
        }

        private function _Str_19368(k:Boolean):void
        {
            var _local_2:IWindow;
            if (this.button)
            {
                _local_2 = (this.button.findChildByName("selected_indicator") as IWindow);
                _local_2.visible = k;
            }
        }

        public function _Str_18911():void
        {
            this._Str_19368(false);
        }
    }
}
