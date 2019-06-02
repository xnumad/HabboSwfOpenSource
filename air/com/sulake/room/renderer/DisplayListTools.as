//com.sulake.room.renderer.DisplayListTools

package com.sulake.room.renderer{
    import flash.utils.Dictionary;
    import starling.display.QuadBatch;
    import com.sulake.room.object.image.ISortableImage;
    import starling.display.DisplayObject;

    public class DisplayListTools {

        public function DisplayListTools();

        public static function resetQuadBatch(k:Dictionary, _arg_2:QuadBatch):void;

        public static function sortQuadBatch(k:Dictionary, _arg_2:QuadBatch):void;

        private static function getSortedImages(k:Dictionary):Array;

        private static function sortOnZAsc(k:ISortableImage, _arg_2:ISortableImage):int;

        public static function sortOnZDesc(k:DisplayObject, _arg_2:DisplayObject):int;


    }
}//package com.sulake.room.renderer

