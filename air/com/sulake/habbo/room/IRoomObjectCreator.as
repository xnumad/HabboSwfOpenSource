//com.sulake.habbo.room.IRoomObjectCreator

package com.sulake.habbo.room{
    import com.sulake.room.utils.IVector3d;

    public /*dynamic*/ interface IRoomObjectCreator {

        function addObjectFurniture(k:int, _arg_2:int, _arg_3:int, _arg_4:IVector3d, _arg_5:IVector3d, _arg_6:int, _arg_7:IStuffData, _arg_8:Number=NaN, _arg_9:int=-1, k0:int=0, k1:int=0, k2:String="", k3:Boolean=true, k4:Boolean=true, k5:Number=-1):Boolean;
        function addObjectFurnitureByName(k:int, _arg_2:int, _arg_3:String, _arg_4:IVector3d, _arg_5:IVector3d, _arg_6:int, _arg_7:IStuffData, _arg_8:Number=NaN):Boolean;
        function updateObjectFurniture(k:int, _arg_2:int, _arg_3:IVector3d, _arg_4:IVector3d, _arg_5:int, _arg_6:IStuffData, _arg_7:Number=NaN):Boolean;
        function updateObjectFurnitureHeight(k:int, _arg_2:int, _arg_3:Number):Boolean;
        function updateObjectFurnitureLocation(k:int, _arg_2:int, _arg_3:IVector3d, _arg_4:IVector3d):Boolean;
        function updateObjectFurnitureExpiryTime(k:int, _arg_2:int, _arg_3:int):Boolean;
        function disposeObjectFurniture(k:int, _arg_2:int, _arg_3:int=-1, _arg_4:Boolean=false):void;
        function addObjectWallItem(k:int, _arg_2:int, _arg_3:int, _arg_4:IVector3d, _arg_5:IVector3d, _arg_6:int, _arg_7:String, _arg_8:int=0, _arg_9:int=0, k0:String="", k1:int=-1, k2:Boolean=true):Boolean;
        function updateObjectWallItem(k:int, _arg_2:int, _arg_3:IVector3d, _arg_4:IVector3d, _arg_5:int, _arg_6:String):Boolean;
        function updateObjectWallItemData(k:int, _arg_2:int, _arg_3:String):Boolean;
        function updateObjectWallItemLocation(k:int, _arg_2:int, _arg_3:IVector3d):Boolean;
        function updateObjectWallItemExpiryTime(k:int, _arg_2:int, _arg_3:int):Boolean;
        function disposeObjectWallItem(k:int, _arg_2:int, _arg_3:int=-1):void;
        function addObjectUser(k:int, _arg_2:int, _arg_3:IVector3d, _arg_4:IVector3d, _arg_5:Number, _arg_6:int, _arg_7:String=null):Boolean;
        function updateObjectUser(k:int, _arg_2:int, _arg_3:IVector3d, _arg_4:IVector3d, _arg_5:Boolean=false, _arg_6:Number=0, _arg_7:IVector3d=null, _arg_8:Number=NaN):Boolean;
        function updateObjectUserFlatControl(k:int, _arg_2:int, _arg_3:String):Boolean;
        function updateObjectUserOwnUserAvatar(k:int, _arg_2:int):Boolean;
        function updateObjectUserFigure(k:int, _arg_2:int, _arg_3:String, _arg_4:String=null, _arg_5:String=null, _arg_6:Boolean=false):Boolean;
        function updateObjectUserAction(k:int, _arg_2:int, _arg_3:String, _arg_4:int, _arg_5:String=null):Boolean;
        function updateObjectUserPosture(k:int, _arg_2:int, _arg_3:String, _arg_4:String=""):Boolean;
        function updateObjectUserGesture(k:int, _arg_2:int, _arg_3:int):Boolean;
        function updateObjectPetGesture(k:int, _arg_2:int, _arg_3:String):Boolean;
        function updateObjectUserEffect(k:int, _arg_2:int, _arg_3:int, _arg_4:int=0):Boolean;
        function disposeObjectUser(k:int, _arg_2:int):void;
        function updateObjectRoom(k:int, _arg_2:String=null, _arg_3:String=null, _arg_4:String=null, _arg_5:Boolean=false):Boolean;
        function updateObjectRoomColor(k:int, _arg_2:uint, _arg_3:int, _arg_4:Boolean):Boolean;
        function updateObjectRoomBackgroundColor(k:int, _arg_2:Boolean, _arg_3:int, _arg_4:int, _arg_5:int):Boolean;
        function updateObjectRoomVisibilities(k:int, _arg_2:Boolean, _arg_3:Boolean=true):Boolean;
        function updateObjectRoomPlaneThicknesses(k:int, _arg_2:Number, _arg_3:Number):Boolean;
        function setRoomObjectAlias(k:String, _arg_2:String):void;
        function getPetTypeId(k:String):int;

    }
}//package com.sulake.habbo.room

