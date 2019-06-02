//com.sulake.habbo.avatar.cache.AvatarImageCache

package com.sulake.habbo.avatar.cache{
    import com.sulake.habbo.avatar.AvatarStructure;
    import com.sulake.habbo.avatar.IAvatarImage;
    import com.sulake.habbo.avatar.alias.AssetAliasCollection;
    import com.sulake.core.utils.Map;
    import com.sulake.habbo.avatar.structure.AvatarCanvas;
    import __AS3__.vec.Vector;
    import flash.geom.ColorTransform;
    import flash.geom.Matrix;
    import com.sulake.habbo.avatar.actions.IActiveActionData;
    import com.sulake.habbo.avatar.AvatarImageBodyPartContainer;
    import com.sulake.habbo.avatar.AvatarImagePartContainer;
    import flash.display.BitmapData;
    import flash.geom.Rectangle;

    public class AvatarImageCache {

        private static const DEFAULT_MAX_CACHE_STORAGE_TIME_MS:int;
        private static const SEPARATOR:String;
        private static const SEPARATED_FRAME_0:String;
        private static const DEF_SEPARATOR:String;
        private static const SEPARATED_BASE_ACTION:String;
        private static const PART_FACE:String;
        private static const PART_EYES:String;
        private static const PART_RIGHT_ITEM:String;
        private static const ACTION_WAVE:String;
        private static const ACTION_DRINK:String;
        private static const ACTION_BLOW:String;
        private static const ACTION_SIGN:String;
        private static const ACTION_RESPECT:String;
        private static const HELPER_PART_ID_ARR:Array;

        private var _structure:AvatarStructure;
        private var _avatar:IAvatarImage;
        private var _assets:AssetAliasCollection;
        private var _scale:String;
        private var _cache:Map;
        private var _canvas:AvatarCanvas;
        private var _disposed:Boolean;
        private var _geometryType:String;
        private var _unionImages:Vector.<ImageData>;
        private var _colorTransform:ColorTransform;
        private var _matrix:Matrix;

        public function AvatarImageCache(k:AvatarStructure, _arg_2:IAvatarImage, _arg_3:AssetAliasCollection, _arg_4:String);

        public function dispose():void;

        public function disposeInactiveActions(k:int=0):void;

        public function resetBodyPartCache(k:IActiveActionData):void;

        public function setDirection(k:String, _arg_2:int):void;

        public function setAction(k:IActiveActionData):void;

        public function setGeometryType(k:String):void;

        public function getImageContainer(k:String, _arg_2:int):AvatarImageBodyPartContainer;

        public function getBodyPartCache(k:String):AvatarImageBodyPartCache;

        private function renderBodyPart(k:int, _arg_2:Vector.<AvatarImagePartContainer>, _arg_3:int, _arg_4:IActiveActionData):AvatarImageBodyPartContainer;

        private function createUnionImage(k:Vector.<ImageData>, _arg_2:Boolean):ImageData;

        private function drawBorders(k:BitmapData, _arg_2:Rectangle, _arg_3:uint):void;

        private function debugInfo(k:String):void;


    }
}//package com.sulake.habbo.avatar.cache

