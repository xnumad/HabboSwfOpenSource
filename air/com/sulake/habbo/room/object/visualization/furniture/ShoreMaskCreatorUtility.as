//com.sulake.habbo.room.object.visualization.furniture.ShoreMaskCreatorUtility

package com.sulake.habbo.room.object.visualization.furniture{
    import flash.display.BitmapData;
    import com.sulake.room.object.visualization.utils.IGraphicAssetCollection;
    import com.sulake.room.object.visualization.utils.IGraphicAsset;

    public class ShoreMaskCreatorUtility {

        public static const OUTER_CUT:int;
        public static const STRAIGHT_CUT:int;
        public static const INNER_CUT:int;
        private static const CUT_TYPE_COUNT:int;
        private static const MASK_COLOR_TRANSPARENT:uint;
        private static const MASK_COLOR_SOLID:uint;

        public function ShoreMaskCreatorUtility();

        public static function createEmptyMask(k:int, _arg_2:int):BitmapData;

        public static function getInstanceMaskName(k:int, _arg_2:int):String;

        public static function getBorderType(k:int, _arg_2:int):int;

        public static function getInstanceMask(k:int, _arg_2:int, _arg_3:IGraphicAssetCollection, _arg_4:IGraphicAsset):IGraphicAsset;

        public static function disposeInstanceMask(k:int, _arg_2:int, _arg_3:IGraphicAssetCollection):void;

        public static function createShoreMask2x2(k:BitmapData, _arg_2:int, _arg_3:Array, _arg_4:Array, _arg_5:IGraphicAssetCollection):BitmapData;

        public static function initializeShoreMasks(k:int, _arg_2:IGraphicAssetCollection, _arg_3:IGraphicAsset):Boolean;

        private static function createMaskLeft(k:int, _arg_2:int):BitmapData;

        private static function cutLeftMask(k:BitmapData, _arg_2:int, _arg_3:int, _arg_4:int):void;

        private static function cutLeftMaskOuterCorner(k:BitmapData, _arg_2:int, _arg_3:Boolean):void;

        private static function cutLeftMaskInnerCorner(k:BitmapData, _arg_2:int):void;

        private static function createMaskRight(k:int, _arg_2:int):BitmapData;

        private static function cutRightMask(k:BitmapData, _arg_2:int, _arg_3:int, _arg_4:int):void;

        private static function cutRightMaskInnerCorner(k:BitmapData, _arg_2:int):void;

        private static function cutRightMaskOuterCorner(k:BitmapData, _arg_2:int, _arg_3:Boolean):void;

        private static function storeLeftMask(k:IGraphicAssetCollection, _arg_2:BitmapData, _arg_3:int, _arg_4:int, _arg_5:int):void;

        private static function storeRightMask(k:IGraphicAssetCollection, _arg_2:BitmapData, _arg_3:int, _arg_4:int, _arg_5:int):void;

        private static function fillTopLeftCorner(k:BitmapData, _arg_2:int, _arg_3:int, _arg_4:int, _arg_5:uint):void;

        private static function fillBottomRightCorner(k:BitmapData, _arg_2:int, _arg_3:int, _arg_4:uint):void;


    }
}//package com.sulake.habbo.room.object.visualization.furniture

