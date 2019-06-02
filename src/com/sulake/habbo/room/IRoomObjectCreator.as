package com.sulake.habbo.room
{
    import com.sulake.room.utils.IVector3d;

    public interface IRoomObjectCreator 
    {
        function addObjectFurniture(_arg_1:int, _arg_2:int, _arg_3:int, _arg_4:IVector3d, _arg_5:IVector3d, _arg_6:int, _arg_7:IStuffData, _arg_8:Number=NaN, _arg_9:int=-1, _arg_10:int=0, _arg_11:int=0, _arg_12:String="", _arg_13:Boolean=true, _arg_14:Boolean=true, _arg_15:Number=-1):Boolean;
        function addObjectFurnitureByName(_arg_1:int, _arg_2:int, _arg_3:String, _arg_4:IVector3d, _arg_5:IVector3d, _arg_6:int, _arg_7:IStuffData, _arg_8:Number=NaN):Boolean;
        function updateObjectFurniture(_arg_1:int, _arg_2:int, _arg_3:IVector3d, _arg_4:IVector3d, _arg_5:int, _arg_6:IStuffData, _arg_7:Number=NaN):Boolean;
        function updateObjectFurnitureHeight(_arg_1:int, _arg_2:int, _arg_3:Number):Boolean;
        function updateObjectFurnitureLocation(_arg_1:int, _arg_2:int, _arg_3:IVector3d, _arg_4:IVector3d):Boolean;
        function updateObjectFurnitureExpiryTime(_arg_1:int, _arg_2:int, _arg_3:int):Boolean;
        function disposeObjectFurniture(_arg_1:int, _arg_2:int, _arg_3:int=-1, _arg_4:Boolean=false):void;
        function addObjectWallItem(_arg_1:int, _arg_2:int, _arg_3:int, _arg_4:IVector3d, _arg_5:IVector3d, _arg_6:int, _arg_7:String, _arg_8:int=0, _arg_9:int=0, _arg_10:String="", _arg_11:int=-1, _arg_12:Boolean=true):Boolean;
        function updateObjectWallItem(_arg_1:int, _arg_2:int, _arg_3:IVector3d, _arg_4:IVector3d, _arg_5:int, _arg_6:String):Boolean;
        function updateObjectUserFlatControl(_arg_1:int, _arg_2:int, _arg_3:String):Boolean;
        function updateObjectWallItemLocation(_arg_1:int, _arg_2:int, _arg_3:IVector3d):Boolean;
        function updateObjectWallItemExpiryTime(_arg_1:int, _arg_2:int, _arg_3:int):Boolean;
        function disposeObjectWallItem(_arg_1:int, _arg_2:int, _arg_3:int=-1):void;
        function addObjectUser(_arg_1:int, _arg_2:int, _arg_3:IVector3d, _arg_4:IVector3d, _arg_5:Number, _arg_6:int, _arg_7:String=null):Boolean;
        function updateObjectUser(_arg_1:int, _arg_2:int, _arg_3:IVector3d, _arg_4:IVector3d, _arg_5:Boolean=false, _arg_6:Number=0, _arg_7:IVector3d=null, _arg_8:Number=NaN):Boolean;
        function updateObjectPetGesture(_arg_1:int, _arg_2:int, _arg_3:String):Boolean;
        function updateObjectUserOwnUserAvatar(_arg_1:int, _arg_2:int):Boolean;
        function updateObjectUserFigure(_arg_1:int, _arg_2:int, _arg_3:String, _arg_4:String=null, _arg_5:String=null, _arg_6:Boolean=false):Boolean;
        function updateObjectUserAction(_arg_1:int, _arg_2:int, _arg_3:String, _arg_4:int, _arg_5:String=null):Boolean;
        function updateObjectUserPosture(_arg_1:int, _arg_2:int, _arg_3:String, _arg_4:String=""):Boolean;
        function updateObjectUserGesture(_arg_1:int, _arg_2:int, _arg_3:int):Boolean;
        function _Str_19224(_arg_1:int, _arg_2:int, _arg_3:String):Boolean;
        function updateObjectUserEffect(_arg_1:int, _arg_2:int, _arg_3:int, _arg_4:int=0):Boolean;
        function disposeObjectUser(_arg_1:int, _arg_2:int):void;
        function updateObjectRoom(_arg_1:int, _arg_2:String=null, _arg_3:String=null, _arg_4:String=null, _arg_5:Boolean=false):Boolean;
        function updateObjectRoomColor(_arg_1:int, _arg_2:uint, _arg_3:int, _arg_4:Boolean):Boolean;
        function updateObjectRoomBackgroundColor(_arg_1:int, _arg_2:Boolean, _arg_3:int, _arg_4:int, _arg_5:int):Boolean;
        function updateObjectRoomVisibilities(_arg_1:int, _arg_2:Boolean, _arg_3:Boolean=true):Boolean;
        function updateObjectRoomPlaneThicknesses(_arg_1:int, _arg_2:Number, _arg_3:Number):Boolean;
        function setRoomObjectAlias(_arg_1:String, _arg_2:String):void;
        function getWallItemTypeId(_arg_1:String):int;
    }
}
