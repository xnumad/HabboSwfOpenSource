//com.sulake.room.utils.ColorConverter

package com.sulake.room.utils{
    public class ColorConverter {

        public function ColorConverter();

        public static function rgbToHSL(k:int):int;

        public static function hslToRGB(k:int):int;

        public static function rgb2xyz(k:int):IVector3d;

        public static function xyz2CieLab(k:IVector3d):IVector3d;

        public static function rgb2CieLab(k:int):IVector3d;


    }
}//package com.sulake.room.utils

