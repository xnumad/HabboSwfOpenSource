﻿package com.sulake.habbo.room
{
    import com.sulake.core.runtime.IUnknown;
    import flash.events.IEventDispatcher;
    import flash.display.DisplayObject;
    import flash.geom.Point;
    import com.sulake.room.utils.IRoomGeometry;
    import com.sulake.room.utils.IVector3D;
    import flash.geom.Rectangle;
    import com.sulake.room.object.IRoomObject;
    import com.sulake.core.utils.Map;
    import flash.display.BitmapData;
    import flash.geom.Matrix;
    import com.sulake.core.communication.messages.IMessageComposer;

    public interface IRoomEngine extends IUnknown 
    {
        function get events():IEventDispatcher;
        function get isInitialized():Boolean;
        function get activeRoomId():int;
        function _Str_14750(_arg_1:int, _arg_2:int, _arg_3:int, _arg_4:int, _arg_5:int):DisplayObject;
        function _Str_5041(_arg_1:int, _arg_2:int, _arg_3:Number, _arg_4:Point=null, _arg_5:Point=null, _arg_6:Boolean=false, _arg_7:Boolean=false, _arg_8:Boolean=false):void;
        function _Str_6976(_arg_1:int, _arg_2:int, _arg_3:int, _arg_4:int):Boolean;
        function _Str_22003(_arg_1:int):Array;
        function _Str_18414(_arg_1:int, _arg_2:int, _arg_3:Boolean):void;
        function _Str_4267(_arg_1:int, _arg_2:int=-1):IRoomGeometry;
        function _Str_7201(_arg_1:int, _arg_2:int=-1):Point;
        function _Str_16921(_arg_1:int, _arg_2:int, _arg_3:Point):Boolean;
        function _Str_5151(_arg_1:int=-1000, _arg_2:int=-1):Number;
        function _Str_17601(_arg_1:int, _arg_2:int, _arg_3:int, _arg_4:String, _arg_5:Boolean, _arg_6:Boolean, _arg_7:Boolean, _arg_8:Boolean):void;
        function _Str_15680(_arg_1:int):void;
        function _Str_9515(_arg_1:int, _arg_2:String):Number;
        function _Str_4323(_arg_1:int, _arg_2:String):String;
        function _Str_24060(_arg_1:int):String;
        function getFurnitureIcon(_arg_1:int, _arg_2:IGetImageListener, _arg_3:String=null, _arg_4:IStuffData=null):ImageResult;
        function _Str_22347(_arg_1:int, _arg_2:String=null):String;
        function getWallItemIcon(_arg_1:int, _arg_2:IGetImageListener, _arg_3:String=null):ImageResult;
        function getFurnitureImage(_arg_1:int, _arg_2:IVector3D, _arg_3:int, _arg_4:IGetImageListener, _arg_5:uint=0, _arg_6:String=null, _arg_7:int=-1, _arg_8:int=-1, _arg_9:IStuffData=null):ImageResult;
        function getGenericRoomObjectImage(_arg_1:String, _arg_2:String, _arg_3:IVector3D, _arg_4:int, _arg_5:IGetImageListener, _arg_6:uint=0, _arg_7:String=null, _arg_8:IStuffData=null, _arg_9:int=-1, _arg_10:int=-1, _arg_11:String=null, _arg_12:int=-1):ImageResult;
        function getWallItemImage(_arg_1:int, _arg_2:IVector3D, _arg_3:int, _arg_4:IGetImageListener, _arg_5:uint=0, _arg_6:String=null, _arg_7:int=-1, _arg_8:int=-1):ImageResult;
        function _Str_2641(_arg_1:int, _arg_2:int, _arg_3:int, _arg_4:IVector3D, _arg_5:int, _arg_6:IGetImageListener, _arg_7:Boolean=true, _arg_8:uint=0, _arg_9:Array=null, _arg_10:String=null):ImageResult;
        function getRoomImage(_arg_1:String, _arg_2:String, _arg_3:String, _arg_4:int, _arg_5:IGetImageListener, _arg_6:String=null):ImageResult;
        function _Str_8562(_arg_1:int, _arg_2:int, _arg_3:int, _arg_4:IVector3D, _arg_5:int, _arg_6:IGetImageListener, _arg_7:uint=0):ImageResult;
        function getRoomObjectBoundingRectangle(_arg_1:int, _arg_2:int, _arg_3:int, _arg_4:int):Rectangle;
        function _Str_6960(_arg_1:int, _arg_2:int, _arg_3:int, _arg_4:int=-1):Point;
        function _Str_21858(_arg_1:int):Rectangle;
        function getRoomObjectCount(_arg_1:int, _arg_2:int):int;
        function getRoomObject(_arg_1:int, _arg_2:int, _arg_3:int):IRoomObject;
        function getRoomObjectWithIndex(_arg_1:int, _arg_2:int, _arg_3:int):IRoomObject;
        function _Str_3571(_arg_1:int, _arg_2:int, _arg_3:String):Boolean;
        function _Str_20856(_arg_1:int, _arg_2:int, _arg_3:String, _arg_4:Map):Boolean;
        function _Str_12849(_arg_1:int, _arg_2:int, _arg_3:String, _arg_4:String):Boolean;
        function _Str_13020(_arg_1:int, _arg_2:int):Boolean;
        function _Str_5346(_arg_1:String, _arg_2:int, _arg_3:int, _arg_4:int, _arg_5:String=null, _arg_6:IStuffData=null, _arg_7:int=-1, _arg_8:int=-1, _arg_9:String=null):Boolean;
        function _Str_8675():void;
        function _Str_6973(_arg_1:int, _arg_2:int):void;
        function _Str_5538(_arg_1:int, _arg_2:int, _arg_3:int):void;
        function _Str_18478(_arg_1:int):String;
        function _Str_3637(_arg_1:int):ISelectedRoomObjectData;
        function _Str_13222():int;
        function _Str_17804(_arg_1:int, _arg_2:uint, _arg_3:int, _arg_4:Boolean):Boolean;
        function _Str_19727(_arg_1:int, _arg_2:Boolean, _arg_3:int, _arg_4:int, _arg_5:int):Boolean;
        function _Str_8639(_arg_1:int, _arg_2:int):PetColorResult;
        function _Str_10160(_arg_1:int, _arg_2:String):Array;
        function _Str_11046(_arg_1:int, _arg_2:String):int;
        function _Str_7761(_arg_1:int, _arg_2:String):PetColorResult;
        function _Str_8303(_arg_1:int, _arg_2:int, _arg_3:int, _arg_4:IVector3D, _arg_5:IVector3D, _arg_6:int, _arg_7:IStuffData, _arg_8:Number=NaN, _arg_9:int=-1, _arg_10:int=0, _arg_11:int=0, _arg_12:String="", _arg_13:Boolean=true, _arg_14:Boolean=true, _arg_15:Number=-1):Boolean;
        function _Str_8640(_arg_1:int, _arg_2:int, _arg_3:int):void;
        function _Str_20271(_arg_1:int, _arg_2:int, _arg_3:int, _arg_4:String, _arg_5:int):Boolean;
        function _Str_6737(_arg_1:int, _arg_2:int, _arg_3:int=-1, _arg_4:Boolean=false):void;
        function _Str_9493(_arg_1:int, _arg_2:int, _arg_3:int, _arg_4:IVector3D, _arg_5:IVector3D, _arg_6:int, _arg_7:String, _arg_8:int=0, _arg_9:int=0, _arg_10:String="", _arg_11:int=-1, _arg_12:Boolean=true):Boolean;
        function _Str_16158(_arg_1:int, _arg_2:int, _arg_3:IVector3D):Boolean;
        function _Str_7974(_arg_1:int, _arg_2:int, _arg_3:int=-1):void;
        function _Str_11865(_arg_1:int, _arg_2:int, _arg_3:IVector3D, _arg_4:IVector3D, _arg_5:Number, _arg_6:int, _arg_7:String=null):Boolean;
        function _Str_11976(_arg_1:int, _arg_2:int, _arg_3:IVector3D, _arg_4:IVector3D, _arg_5:Boolean=false, _arg_6:Number=0, _arg_7:IVector3D=null, _arg_8:Number=NaN):Boolean;
        function _Str_7543(_arg_1:int, _arg_2:int, _arg_3:String, _arg_4:String=null, _arg_5:String=null, _arg_6:Boolean=false):Boolean;
        function _Str_7176(_arg_1:int, _arg_2:int, _arg_3:String, _arg_4:String=""):Boolean;
        function _Str_9104(_arg_1:int, _arg_2:int, _arg_3:int):Boolean;
        function _Str_12204(_arg_1:int, _arg_2:int, _arg_3:int, _arg_4:int=0):Boolean;
        function _Str_3689(_arg_1:int, _arg_2:int, _arg_3:String, _arg_4:int, _arg_5:String=null):Boolean;
        function _Str_9451(_arg_1:int, _arg_2:int):void;
        function _Str_4377(_arg_1:int, _arg_2:String=null, _arg_3:String=null, _arg_4:String=null, _arg_5:Boolean=false):Boolean;
        function _Str_14972(_arg_1:int):String;
        function _Str_19383(_arg_1:String):int;
        function _Str_5211(_arg_1:int, _arg_2:String=null):String;
        function _Str_19873(_arg_1:int, _arg_2:int):Boolean;
        function _Str_10152(_arg_1:int, _arg_2:XML):void;
        function disposeRoom(_arg_1:int):void;
        function get _Str_6249():Boolean;
        function set _Str_6374(_arg_1:Boolean):void;
        function get _Str_6374():Boolean;
        function _Str_11714(_arg_1:int, _arg_2:int, _arg_3:int=-1):void;
        function _Str_22946(_arg_1:int):void;
        function _Str_16048(_arg_1:int, _arg_2:int):void;
        function _Str_21042(_arg_1:int, _arg_2:Boolean):void;
        function addObjectUpdateCategory(_arg_1:int):void;
        function removeObjectUpdateCategory(_arg_1:int):void;
        function _Str_16420(_arg_1:int, _arg_2:int, _arg_3:BitmapData, _arg_4:Matrix, _arg_5:Boolean):Boolean;
        function set _Str_9081(_arg_1:Boolean):void;
        function _Str_19596():void;
        function _Str_15359(_arg_1:int, _arg_2:Boolean, _arg_3:Boolean=true):Boolean;
        function get _Str_17507():int;
        function set _Str_17507(_arg_1:int):void;
        function get _Str_15268():int;
        function set _Str_15268(_arg_1:int):void;
        function _Str_9972(_arg_1:Rectangle, _arg_2:uint, _arg_3:Boolean=false, _arg_4:Boolean=true, _arg_5:Boolean=false, _arg_6:int=-1):IMessageComposer;
        function _Str_19272(_arg_1:int, _arg_2:int, _arg_3:String):void;
		
		function _SafeStr_7811(k:int, _arg_2:int, _arg_3:IVector3D, _arg_4:int):Boolean;
		function _SafeStr_7817(k:int, _arg_2:int, _arg_3:IVector3D, _arg_4:int):Boolean;
    }
}
