package com.sulake.room.object.visualization
{
    import flash.display.BitmapData;

    public interface IRoomObjectSprite 
    {
        function get asset():BitmapData;
        function set asset(_arg_1:BitmapData):void;
        function get assetName():String;
        function set assetName(_arg_1:String):void;
        function get libraryAssetName():String;
        function set libraryAssetName(_arg_1:String):void;
        function get assetPosture():String;
        function set assetPosture(_arg_1:String):void;
        function get visible():Boolean;
        function set visible(_arg_1:Boolean):void;
        function get tag():String;
        function set tag(_arg_1:String):void;
        function get alpha():int;
        function set alpha(_arg_1:int):void;
        function get color():int;
        function set color(_arg_1:int):void;
        function get blendMode():String;
        function set blendMode(_arg_1:String):void;
        function get filters():Array;
        function set filters(_arg_1:Array):void;
        function get flipH():Boolean;
        function set flipH(_arg_1:Boolean):void;
        function get flipV():Boolean;
        function set flipV(_arg_1:Boolean):void;
        function get direction():int;
        function set direction(_arg_1:int):void;
        function get offsetX():int;
        function set offsetX(_arg_1:int):void;
        function get offsetY():int;
        function set offsetY(_arg_1:int):void;
        function get width():int;
        function get height():int;
        function get relativeDepth():Number;
        function set relativeDepth(_arg_1:Number):void;
        function get varyingDepth():Boolean;
        function set varyingDepth(_arg_1:Boolean):void;
        function get clickHandling():Boolean;
        function set clickHandling(_arg_1:Boolean):void;
        function get instanceId():int;
        function get updateId():int;
        function set spriteType(_arg_1:int):void;
        function get spriteType():int;
        function set objectType(_arg_1:String):void;
        function get objectType():String;
        function get alphaTolerance():int;
        function set alphaTolerance(_arg_1:int):void;
        function get planeId():int;
        function set planeId(_arg_1:int):void;
    }
}
