//com.sulake.room.object.image.ISortableImage

package com.sulake.room.object.image{
    import flash.display.BitmapData;
    import starling.textures.Texture;
    import starling.display.DisplayObjectContainer;
    import starling.display.DisplayObject;
    import flash.geom.Rectangle;

    public /*dynamic*/ interface ISortableImage {

        function dispose():void;
        function get disposed():Boolean;
        function set flashBlendMode(k:String):void;
        function set objectInstanceId(k:int):void;
        function get objectInstanceId():int;
        function set spriteId(k:int):void;
        function get spriteId():int;
        function set spriteOffsetX(k:int):void;
        function get spriteOffsetX():int;
        function set spriteOffsetY(k:int):void;
        function get spriteOffsetY():int;
        function set asset(k:BitmapData):void;
        function get asset():BitmapData;
        function set alphaTolerance(k:int):void;
        function get alphaTolerance():int;
        function set updateId(k:int):void;
        function get updateId():int;
        function setAlphaFrom256(k:int):void;
        function set x(k:Number):void;
        function get x():Number;
        function set y(k:Number):void;
        function get y():Number;
        function set alpha(k:Number):void;
        function get alpha():Number;
        function set blendMode(k:String):void;
        function get blendMode():String;
        function set z(k:Number):void;
        function get z():Number;
        function set texture(k:Texture):void;
        function get texture():Texture;
        function set width(k:Number):void;
        function get width():Number;
        function set height(k:Number):void;
        function get height():Number;
        function set visible(k:Boolean):void;
        function get visible():Boolean;
        function set scaleX(k:Number):void;
        function get scaleX():Number;
        function set scaleY(k:Number):void;
        function get scaleY():Number;
        function get parent():DisplayObjectContainer;
        function set smoothing(k:String):void;
        function get smoothing():String;
        function get name():String;
        function set name(k:String):void;
        function getBounds(k:DisplayObject, _arg_2:Rectangle=null):Rectangle;
        function get bounds():Rectangle;
        function set color(k:uint):void;
        function get color():uint;
        function readjustSize():void;
        function removeFromParent(k:Boolean=false):void;
        function addEventListener(k:String, _arg_2:Function):void;
        function removeEventListener(k:String, _arg_2:Function):void;

    }
}//package com.sulake.room.object.image

