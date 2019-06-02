//com.sulake.habbo.avatar.geometry.AvatarModelGeometry

package com.sulake.habbo.avatar.geometry{
    import flash.utils.Dictionary;
    import flash.geom.Vector3D;
    import com.sulake.habbo.avatar.IAvatarImage;
    import com.sulake.habbo.avatar.structure.AvatarCanvas;
    import __AS3__.vec.Vector;

    public class AvatarModelGeometry {

        private var _avatarSet:AvatarSet;
        private var _geometryTypes:Dictionary;
        private var _itemIdToBodyPartMap:Dictionary;
        private var _transformation:Matrix4x4;
        private var _camera:Vector3D;
        private var _canvases:Dictionary;

        public function AvatarModelGeometry(k:XML);

        public function removeDynamicItems(k:IAvatarImage):void;

        public function getBodyPartIdsInAvatarSet(k:String):Array;

        public function isMainAvatarSet(k:String):Boolean;

        public function getCanvas(k:String, _arg_2:String):AvatarCanvas;

        private function typeExists(k:String):Boolean;

        private function hasBodyPart(k:String, _arg_2:String):Boolean;

        private function getBodyPartIDs(k:String):Array;

        private function getBodyPartsOfType(k:String):Dictionary;

        public function getBodyPart(k:String, _arg_2:String):GeometryBodyPart;

        public function getBodyPartOfItem(k:String, _arg_2:String, _arg_3:IAvatarImage):GeometryBodyPart;

        private function getBodyPartsInAvatarSet(k:Dictionary, _arg_2:String):Array;

        public function getBodyPartsAtAngle(k:String, _arg_2:uint, _arg_3:String):Vector.<String>;

        public function getParts(k:String, _arg_2:String, _arg_3:uint, _arg_4:IAvatarImage):Array;

        private function orderByDistance(k:Array, _arg_2:Array):Number;


    }
}//package com.sulake.habbo.avatar.geometry

