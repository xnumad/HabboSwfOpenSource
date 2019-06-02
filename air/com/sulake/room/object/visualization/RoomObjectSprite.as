//com.sulake.room.object.visualization.RoomObjectSprite

package com.sulake.room.object.visualization{
    import flash.display.BitmapData;
    import com.sulake.room.object.image.ISortableImage;
    import away3d.entities.Mesh;

    public final class RoomObjectSprite implements IRoomObjectSprite {

        private static var _globalInstanceId:int;

        private var _asset:BitmapData;
        private var _image:ISortableImage;
        private var _textureName:String;
        private var _isShadow:Boolean;
        private var _assetName:String;
        private var _visible:Boolean;
        private var _tag:String;
        private var _alpha:int;
        private var _alphaDec:Number;
        private var _color:int;
        private var _blendMode:String;
        private var _flipH:Boolean;
        private var _flipV:Boolean;
        private var _offsetX:int;
        private var _offsetY:int;
        private var _width:int;
        private var _height:int;
        private var _depth:Number = 0;
        private var _mesh:Mesh;
        private var _varyingDepth:Boolean;
        private var _alphaTolerance:int;
        private var _clickHandling:Boolean;
        private var _updateID:uint;
        private var _instanceId:int;
        private var _filters:Array;
        protected var _spriteType:int;

        public function RoomObjectSprite();

        public function dispose():void;

        public function get asset():BitmapData;

        public function get assetName():String;

        public function get image():ISortableImage;

        public function get textureName():String;

        public function get isShadow():Boolean;

        public function get visible():Boolean;

        public function get tag():String;

        public function get alpha():int;

        public function get alphaDec():Number;

        public function get color():int;

        public function get blendMode():String;

        public function get flipV():Boolean;

        public function get flipH():Boolean;

        public function get offsetX():int;

        public function get offsetY():int;

        public function get width():int;

        public function get height():int;

        public function get relativeDepth():Number;

        public function get varyingDepth():Boolean;

        public function get clickHandling():Boolean;

        public function get instanceId():int;

        public function get updateId():int;

        public function get filters():Array;

        public function get spriteType():int;

        public function forceUpdate():void;

        public function set spriteType(k:int):void;

        public function set asset(k:BitmapData):void;

        public function set image(k:ISortableImage):void;

        public function set textureName(k:String):void;

        public function set assetName(k:String):void;

        public function set visible(k:Boolean):void;

        public function set tag(k:String):void;

        public function set alpha(k:int):void;

        public function set color(k:int):void;

        public function set blendMode(k:String):void;

        public function set filters(k:Array):void;

        public function set flipH(k:Boolean):void;

        public function set flipV(k:Boolean):void;

        public function set offsetX(k:int):void;

        public function set offsetY(k:int):void;

        public function set relativeDepth(k:Number):void;

        public function set varyingDepth(k:Boolean):void;

        public function set clickHandling(k:Boolean):void;

        public function get alphaTolerance():int;

        public function set alphaTolerance(k:int):void;

        public function get mesh():Mesh;

        public function set mesh(k:Mesh):void;


    }
}//package com.sulake.room.object.visualization

