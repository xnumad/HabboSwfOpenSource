//com.sulake.room.object.visualization.IRoomObjectSprite

package com.sulake.room.object.visualization{
    import flash.display.BitmapData;
    import com.sulake.room.object.image.ISortableImage;
    import away3d.entities.Mesh;

    public /*dynamic*/ interface IRoomObjectSprite {

        function get asset():BitmapData;
        function set asset(k:BitmapData):void;
        function forceUpdate():void;
        function set image(k:ISortableImage):void;
        function get image():ISortableImage;
        function set textureName(k:String):void;
        function get textureName():String;
        function set mesh(k:Mesh):void;
        function get mesh():Mesh;
        function get isShadow():Boolean;
        function get assetName():String;
        function set assetName(k:String):void;
        function get visible():Boolean;
        function set visible(k:Boolean):void;
        function get tag():String;
        function set tag(k:String):void;
        function get alpha():int;
        function get alphaDec():Number;
        function set alpha(k:int):void;
        function get color():int;
        function set color(k:int):void;
        function get blendMode():String;
        function set blendMode(k:String):void;
        function get filters():Array;
        function set filters(k:Array):void;
        function get flipH():Boolean;
        function set flipH(k:Boolean):void;
        function get flipV():Boolean;
        function set flipV(k:Boolean):void;
        function get offsetX():int;
        function set offsetX(k:int):void;
        function get offsetY():int;
        function set offsetY(k:int):void;
        function get width():int;
        function get height():int;
        function get relativeDepth():Number;
        function set relativeDepth(k:Number):void;
        function get varyingDepth():Boolean;
        function set varyingDepth(k:Boolean):void;
        function get clickHandling():Boolean;
        function set clickHandling(k:Boolean):void;
        function get instanceId():int;
        function get updateId():int;
        function set spriteType(k:int):void;
        function get spriteType():int;
        function get alphaTolerance():int;
        function set alphaTolerance(k:int):void;

    }
}//package com.sulake.room.object.visualization

